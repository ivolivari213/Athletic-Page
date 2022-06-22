package com.example.project3;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.ListView;

import java.util.ArrayList;

public class MainActivity extends AppCompatActivity {



    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_menu);
        ligasButton();
        ligasByButton();
        clubLigaButton();
        juezLigaButton();
        clubEntrenadorButton();
    }

    private void ligasButton(){
        Button ligasButton =(Button) findViewById(R.id.ligasbutton);
        ligasButton.setOnClickListener(new View.OnClickListener(){
            @Override
            public void onClick(View view){

                Select o = new Select( 1);

                Intent i = new Intent(MainActivity.this,LigasDirect.class);
                i.putExtra("option",o);
                startActivity(i);


            }
        });

    }
    private void ligasByButton(){
        Button ligasByDirectButton =(Button) findViewById(R.id.directivosbutton);
        ligasByDirectButton.setOnClickListener(new View.OnClickListener(){
            @Override
            public void onClick(View view){

                Select o = new Select( 2);

                Intent i = new Intent(MainActivity.this,LigasByDirect.class);
                i.putExtra("option",o);
                startActivity(i);


            }
        });

    }

    private void clubLigaButton(){
        Button clubesLigaButton =(Button) findViewById(R.id.clubligabutton);
        clubesLigaButton.setOnClickListener(new View.OnClickListener(){
            @Override
            public void onClick(View view){

                Select o = new Select( 3);

                Intent i = new Intent(MainActivity.this,clubLiga.class);
                i.putExtra("option",o);
                startActivity(i);


            }
        });

    }

    private void juezLigaButton(){
        Button juecesLigasButton =(Button) findViewById(R.id.juezligabutton);
        juecesLigasButton.setOnClickListener(new View.OnClickListener(){
            @Override
            public void onClick(View view){

                Select o = new Select( 4);

                Intent i = new Intent(MainActivity.this,juezLiga.class);
                i.putExtra("option",o);
                startActivity(i);


            }
        });

    }

    private void clubEntrenadorButton(){
        Button clubEntrenadoresButton =(Button) findViewById(R.id.entrenadoresclubbutton);
        clubEntrenadoresButton.setOnClickListener(new View.OnClickListener(){
            @Override
            public void onClick(View view){

                Select o = new Select( 5);

                Intent i = new Intent(MainActivity.this,clubEntrenador.class);
                i.putExtra("option",o);
                startActivity(i);


            }
        });

    }


}
