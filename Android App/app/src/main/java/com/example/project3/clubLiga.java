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

public class clubLiga extends AppCompatActivity {
    //This is for debugging
    private String TAG = MainActivity.class.getSimpleName();

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
            Toast.makeText(clubLiga.this, "Items list is downloading", Toast.LENGTH_LONG).show();
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
            String url = "http://"+hostAddress+"/getClub";

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
                        String organizacionNombre = c.getString("organizacionNombre");
                        String puebloNombre = c.getString("puebloNombre");
                        String organizacionRegistroDptoEstado = c.getString("organizacionRegistroDptoEstado");
                        String organizacionTelefono = c.getString("organizacionTelefono");
                        String organizacionDireccionFisica = c.getString("organizacionDireccionFisica");
                        String organizacionCorreoElectronico = c.getString("organizacionCorreoElectronico");
                        String organizacionPaginaWeb = c.getString("organizacionPaginaWeb");
                        String organizacionReglamentoUrl = c.getString("organizacionReglamentoUrl");

                        //Create URL for each image



                        // Create an userItem object and add it to the items' list
                        itemUserList.add(new userItem(organizacionNombre, puebloNombre,organizacionRegistroDptoEstado,organizacionTelefono,
                                organizacionDireccionFisica,organizacionCorreoElectronico,organizacionPaginaWeb,organizacionReglamentoUrl));
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
        public Drawable LoadImageFromWebOperations(String url) {
            try {
                //Request the image to the web server
                InputStream is = (InputStream) new URL(url).getContent();

                //Generates an android.graphics.drawable.Drawable object
                Drawable d = Drawable.createFromStream(is, "src name");

                return d; }
            catch (Exception e) {
                return null;
            }
        }
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
                convertView = LayoutInflater.from(getContext()).inflate(R.layout.activity_club_liga, parent, false);
            }
            // Lookup view for data population
            TextView organizacionNombre = (TextView) convertView.findViewById(R.id.organizacionNombre);
            TextView puebloNombre = (TextView) convertView.findViewById(R.id.puebloNombre);
            TextView organizacionRegistroDptoEstado = (TextView) convertView.findViewById(R.id.organizacionRegistroDptoEstado);
            TextView organizacionTelefono = (TextView) convertView.findViewById(R.id.organizacionTelefono);
            TextView organizacionDireccionFisica = (TextView) convertView.findViewById(R.id.organizacionDireccionFisica);
            TextView organizacionCorreoElectronico = (TextView) convertView.findViewById(R.id.organizacionCorreoElectronico);
            TextView organizacionPaginaWeb = (TextView) convertView.findViewById(R.id.organizacionPaginaWeb);
            TextView organizacionReglamentoUrl = (TextView) convertView.findViewById(R.id.organizacionReglamentoUrl);





            // Populate the data into the template view using the data object
            organizacionNombre.setText(user.organizacionNombre);

            organizacionNombre.setText(user.organizacionNombre);
            puebloNombre.setText(user.puebloNombre);
            organizacionRegistroDptoEstado.setText(user.organizacionRegistroDptoEstado);
            organizacionTelefono.setText(user.organizacionTelefono);
            organizacionDireccionFisica.setText(user.organizacionDireccionFisica);

            organizacionCorreoElectronico.setText(user.organizacionCorreoElectronico);
            organizacionPaginaWeb.setText(user.organizacionPaginaWeb);
            organizacionReglamentoUrl.setText(user.organizacionReglamentoUrl);


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

        // Item's image

        public String organizacionNombre;
        public String puebloNombre;
        public String organizacionRegistroDptoEstado;
        public String organizacionTelefono;
        public String organizacionDireccionFisica;
        public String organizacionCorreoElectronico;
        public String organizacionPaginaWeb;
        public String organizacionReglamentoUrl;


        /**

         */
        public userItem(String organizacionNombre,String puebloNombre,
                        String organizacionRegistroDptoEstado,String organizacionTelefono,String organizacionDireccionFisica,
                        String organizacionCorreoElectronico,String organizacionPaginaWeb,String organizacionReglamentoUrl) {

            this.organizacionNombre = organizacionNombre;
            this.puebloNombre = puebloNombre;
            this.organizacionRegistroDptoEstado = organizacionRegistroDptoEstado;
            this.organizacionTelefono = organizacionTelefono;
            this.organizacionDireccionFisica = organizacionDireccionFisica;

            this.organizacionCorreoElectronico = organizacionCorreoElectronico;
            this.organizacionPaginaWeb = organizacionPaginaWeb;
            this.organizacionReglamentoUrl = organizacionReglamentoUrl;

        }


    }
}

