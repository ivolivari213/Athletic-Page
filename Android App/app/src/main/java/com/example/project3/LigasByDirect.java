package com.example.project3;
import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;

import android.app.Activity;
import android.content.Context;
import android.graphics.drawable.Drawable;
import android.os.AsyncTask;
//import android.support.v7.app.AppCompatActivity;
import androidx.appcompat.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.Toast;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.InputStream;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
public class LigasByDirect extends AppCompatActivity {
    //This is for debugging
    private String TAG = LigasByDirect.class.getSimpleName();

    //This is for managing the "Listview" in the activity
    private ListView lv;

    //Web server's IP address
    private String hostAddress;

    //Users adapter
    private UsersAdapter adapter;

    // Item list for storing data from the web server
    private ArrayList<userItem> itemUserList;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.listview);

        // Define the web server's IP address

        hostAddress="10.3.26.106:8085";
        //Instate the Item list
        itemUserList = new ArrayList<>();

        // Defines the adapter: Receives the context (Current activity) and the Arraylist
        adapter = new UsersAdapter(this, itemUserList);

        // Create a accessor to the ListView in the activity
        lv = (ListView) findViewById(R.id.itemList);

        // Create and start the thread
        new GetItems(this).execute();
    }

    /***
     *  This class is a thread for receiving and process data from the Web server
     */
    private class GetItems extends AsyncTask<Void, Void, Void> {

        // Context: every transaction in a Android application must be attached to a context
        private Activity activity;

        private Drawable actualBaseImage;

        /***
         * Special constructor: assigns the context to the thread
         *
         * @param activity: Context
         */
        //@Override
        protected GetItems(Activity activity)
        {
            this.activity = activity;
        }

        /**
         *  on PreExecute method: runs after the constructor is called and before the thread runs
         */
        protected void onPreExecute() {
            super.onPreExecute();
            Toast.makeText(LigasByDirect.this, "Items list is downloading", Toast.LENGTH_LONG).show();
        }

        /***
         *  Main thread
         * @param arg0
         * @return
         */
        protected Void doInBackground(Void... arg0) {
            //Create a HttpHandler object
            HttpHandler sh = new HttpHandler();

            // Making a request to url and getting response
            String url = "http://"+hostAddress+"/getLiga";

            // Download data from the web server using JSON;
            String jsonStr = sh.makeServiceCall(url);

            // Log download's results
            Log.e(TAG, "Response from url: " + jsonStr);

            //The JSON data must contain an array of JSON objects
            if (jsonStr != null) {
                try {
                    //Define a JSON object from the received data
                    JSONObject jsonObj = new JSONObject(jsonStr);

                    // Getting JSON Array node
                    JSONArray items = jsonObj.getJSONArray("Project3");

                    // looping through All Items
                    for (int i = 0; i < items.length(); i++) {
                        JSONObject c = items.getJSONObject(i);
                        String personaNombres = c.getString("personaNombres");
                        String personaApellidos = c.getString("personaApellidos");
                        String posicionNombre = c.getString("posicionNombre");


                        //Create URL for each image



                        // Create an userItem object and add it to the items' list
                        itemUserList.add(new userItem(personaNombres, personaApellidos,posicionNombre));
                    }
                } //Log any problem with received data
                catch (final JSONException e) {
                    Log.e(TAG, "Json parsing error: " + e.getMessage());
                    runOnUiThread(new Runnable() {
                        @Override
                        public void run() {
                            Toast.makeText(getApplicationContext(),
                                    "Json parsing error: " + e.getMessage(),
                                    Toast.LENGTH_LONG).show(); }
                    });
                }
            } else {
                Log.e(TAG, "Couldn't get json from server.");
                runOnUiThread(new Runnable() {
                    @Override
                    public void run() {

                        Toast.makeText(getApplicationContext(),
                                "Couldn't get json from server. Check LogCat for possible errors!",
                                Toast.LENGTH_LONG).show();
                    }
                });
            }
            return null;
        }

        /***
         *  This method runs after thread completion
         *  Set up the List view using the ArrayAdapter
         *
         * @param result
         */
        protected void onPostExecute (Void result){
            super.onPostExecute(result);
            lv.setAdapter(adapter);
        }

        /***
         *  This method downloads a image from a web server using an URL
         * @param url: Image URL
         * @return  d: android.graphics.drawable.Drawable;
         * */

    }



    /**
     * This class defines a ArrayAdapter for the ListView manipulation
     */
    public class UsersAdapter extends ArrayAdapter<userItem> {

        /**
         *  Constructor:
         * @param context: Activity
         * @param users: ArrayList for storing Items list
         */
        public UsersAdapter(Context context, ArrayList<userItem> users) {
            super(context, 0, users);
        }

        /***
         *  This method generates a view for manipulating the item list
         *  This method is called from the ListView.
         *
         * @param position: Item's position in the ArrayList
         * @param convertView:
         * @param parent
         * @return
         */
        @Override
        public View getView(int position, View convertView, ViewGroup parent) {
            // Get the data item for this position
            userItem user = getItem(position);
            // Check if an existing view is being reused, otherwise inflate the view
            if (convertView == null) {
                convertView = LayoutInflater.from(getContext()).inflate(R.layout.activity_ligas_by_direct, parent, false);
            }
            // Lookup view for data population
            TextView personaNombres = (TextView) convertView.findViewById(R.id.personaNombres);
            TextView personaApellidos = (TextView) convertView.findViewById(R.id.personaApellidos);
            TextView posicionNombre = (TextView) convertView.findViewById(R.id.posicionNombre);







            // Populate the data into the template view using the data object
            personaNombres.setText(user.personaNombres);
            personaApellidos.setText(user.personaApellidos);
            posicionNombre.setText(user.posicionNombre);




            // Return the completed view to render on screen
            convertView.setTag(position);

            //Create Listener to detect a click

            return convertView;
        }
    }

    /**
     *  This class generates a Data structure for manipulating each Item in the application
     */
    public class userItem {
        // Item's list
        public String personaNombres;
        // Item's price
        public String personaApellidos;
        // Item's image


        public String posicionNombre;




        /**

         */
        public userItem(String personaNombres, String  personaApellidos, String posicionNombre) {
            this.personaNombres = personaNombres;
            this.personaApellidos = personaApellidos;
            this.posicionNombre = posicionNombre;



        }


    }
}

