.class public Lde/up/cs/mapawo/ms/memonemo/MainActivity;
.super Landroid/support/v7/app/AppCompatActivity;
.source "MainActivity.java"


# static fields
.field static final MAX_PREVIEW_SIZE:I = 0x28


# instance fields
.field adapter:Landroid/widget/SimpleAdapter;

.field notesList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field notesView:Landroid/widget/ListView;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 27
    invoke-direct {p0}, Landroid/support/v7/app/AppCompatActivity;-><init>()V

    .line 29
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lde/up/cs/mapawo/ms/memonemo/MainActivity;->notesList:Ljava/util/ArrayList;

    return-void
.end method


# virtual methods
.method public dbgDelete()V
    .locals 6

    .line 180
    invoke-virtual {p0}, Lde/up/cs/mapawo/ms/memonemo/MainActivity;->getFilesDir()Ljava/io/File;

    move-result-object v0

    .line 181
    .local v0, "fileList":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v1

    .line 182
    .local v1, "files":[Ljava/io/File;
    array-length v2, v1

    const/4 v3, 0x0

    move v4, v3

    :goto_0
    if-ge v4, v2, :cond_0

    aget-object v5, v1, v4

    .line 183
    .local v5, "file":Ljava/io/File;
    invoke-virtual {v5}, Ljava/io/File;->delete()Z

    .line 182
    .end local v5    # "file":Ljava/io/File;
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 186
    :cond_0
    const-string v2, "All notes cleared!"

    invoke-static {p0, v2, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    .line 187
    invoke-virtual {p0}, Lde/up/cs/mapawo/ms/memonemo/MainActivity;->loadNotesList()V

    .line 188
    return-void
.end method

.method public fileExists(Ljava/lang/String;)Z
    .locals 2
    .param p1, "fname"    # Ljava/lang/String;

    .line 163
    invoke-virtual {p0}, Lde/up/cs/mapawo/ms/memonemo/MainActivity;->getBaseContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/Context;->getFileStreamPath(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    .line 164
    .local v0, "file":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    return v1
.end method

.method public loadNote(Ljava/lang/String;)V
    .locals 8
    .param p1, "fileName"    # Ljava/lang/String;

    .line 105
    invoke-virtual {p0, p1}, Lde/up/cs/mapawo/ms/memonemo/MainActivity;->fileExists(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 107
    :try_start_0
    invoke-virtual {p0, p1}, Lde/up/cs/mapawo/ms/memonemo/MainActivity;->openFileInput(Ljava/lang/String;)Ljava/io/FileInputStream;

    move-result-object v0

    .line 108
    .local v0, "in":Ljava/io/InputStream;
    if-eqz v0, :cond_2

    .line 109
    new-instance v1, Ljava/io/InputStreamReader;

    invoke-direct {v1, v0}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    .line 110
    .local v1, "tmp":Ljava/io/InputStreamReader;
    new-instance v2, Ljava/io/BufferedReader;

    invoke-direct {v2, v1}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 111
    .local v2, "reader":Ljava/io/BufferedReader;
    invoke-virtual {v2}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v3

    .line 112
    .local v3, "title":Ljava/lang/String;
    invoke-virtual {v2}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v4

    .line 113
    .local v4, "preview":Ljava/lang/String;
    if-nez v4, :cond_0

    const v5, 0x7f0e002f

    invoke-virtual {p0, v5}, Lde/up/cs/mapawo/ms/memonemo/MainActivity;->getString(I)Ljava/lang/String;

    move-result-object v5

    move-object v4, v5

    .line 114
    :cond_0
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v5

    const/16 v6, 0x28

    if-le v5, v6, :cond_1

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v7, 0x0

    invoke-virtual {v4, v7, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, "..."

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    move-object v4, v5

    .line 115
    :cond_1
    new-instance v5, Ljava/util/HashMap;

    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    .line 116
    .local v5, "listItem":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v6, "title"

    invoke-interface {v5, v6, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 117
    const-string v6, "description"

    invoke-interface {v5, v6, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 118
    const-string v6, "filename"

    invoke-interface {v5, v6, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 119
    iget-object v6, p0, Lde/up/cs/mapawo/ms/memonemo/MainActivity;->notesList:Ljava/util/ArrayList;

    invoke-virtual {v6, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 120
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 122
    .end local v0    # "in":Ljava/io/InputStream;
    .end local v1    # "tmp":Ljava/io/InputStreamReader;
    .end local v2    # "reader":Ljava/io/BufferedReader;
    .end local v3    # "title":Ljava/lang/String;
    .end local v4    # "preview":Ljava/lang/String;
    .end local v5    # "listItem":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :catch_0
    move-exception v0

    .line 123
    .local v0, "t":Ljava/lang/Throwable;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Exception: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x1

    invoke-static {p0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 122
    .end local v0    # "t":Ljava/lang/Throwable;
    :catch_1
    move-exception v0

    .line 127
    :cond_2
    :goto_0
    return-void
.end method

.method public loadNotesList()V
    .locals 6

    .line 85
    invoke-virtual {p0}, Lde/up/cs/mapawo/ms/memonemo/MainActivity;->getFilesDir()Ljava/io/File;

    move-result-object v0

    .line 86
    .local v0, "fileList":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v1

    .line 88
    .local v1, "files":[Ljava/io/File;
    iget-object v2, p0, Lde/up/cs/mapawo/ms/memonemo/MainActivity;->notesList:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->clear()V

    .line 89
    new-instance v2, Lde/up/cs/mapawo/ms/memonemo/MainActivity$2;

    invoke-direct {v2, p0}, Lde/up/cs/mapawo/ms/memonemo/MainActivity$2;-><init>(Lde/up/cs/mapawo/ms/memonemo/MainActivity;)V

    invoke-static {v1, v2}, Ljava/util/Arrays;->sort([Ljava/lang/Object;Ljava/util/Comparator;)V

    .line 96
    array-length v2, v1

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_0

    aget-object v4, v1, v3

    .line 98
    .local v4, "file":Ljava/io/File;
    invoke-virtual {v4}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v5}, Lde/up/cs/mapawo/ms/memonemo/MainActivity;->loadNote(Ljava/lang/String;)V

    .line 96
    .end local v4    # "file":Ljava/io/File;
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 100
    :cond_0
    iget-object v2, p0, Lde/up/cs/mapawo/ms/memonemo/MainActivity;->adapter:Landroid/widget/SimpleAdapter;

    invoke-virtual {v2}, Landroid/widget/SimpleAdapter;->notifyDataSetChanged()V

    .line 101
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 8
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .line 36
    invoke-super {p0, p1}, Landroid/support/v7/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 37
    const v0, 0x7f0b001d

    invoke-virtual {p0, v0}, Lde/up/cs/mapawo/ms/memonemo/MainActivity;->setContentView(I)V

    .line 38
    const v0, 0x7f0800c4

    invoke-virtual {p0, v0}, Lde/up/cs/mapawo/ms/memonemo/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/support/v7/widget/Toolbar;

    .line 39
    .local v0, "toolbar":Landroid/support/v7/widget/Toolbar;
    invoke-virtual {p0, v0}, Lde/up/cs/mapawo/ms/memonemo/MainActivity;->setSupportActionBar(Landroid/support/v7/widget/Toolbar;)V

    .line 41
    const v1, 0x7f080074

    invoke-virtual {p0, v1}, Lde/up/cs/mapawo/ms/memonemo/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ListView;

    iput-object v1, p0, Lde/up/cs/mapawo/ms/memonemo/MainActivity;->notesView:Landroid/widget/ListView;

    .line 43
    new-instance v1, Landroid/widget/SimpleAdapter;

    iget-object v4, p0, Lde/up/cs/mapawo/ms/memonemo/MainActivity;->notesList:Ljava/util/ArrayList;

    const-string v2, "title"

    const-string v3, "description"

    filled-new-array {v2, v3}, [Ljava/lang/String;

    move-result-object v6

    const/4 v2, 0x2

    new-array v7, v2, [I

    fill-array-data v7, :array_0

    const v5, 0x1090004

    move-object v2, v1

    move-object v3, p0

    invoke-direct/range {v2 .. v7}, Landroid/widget/SimpleAdapter;-><init>(Landroid/content/Context;Ljava/util/List;I[Ljava/lang/String;[I)V

    iput-object v1, p0, Lde/up/cs/mapawo/ms/memonemo/MainActivity;->adapter:Landroid/widget/SimpleAdapter;

    .line 45
    iget-object v1, p0, Lde/up/cs/mapawo/ms/memonemo/MainActivity;->notesView:Landroid/widget/ListView;

    iget-object v2, p0, Lde/up/cs/mapawo/ms/memonemo/MainActivity;->adapter:Landroid/widget/SimpleAdapter;

    invoke-virtual {v1, v2}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 46
    iget-object v1, p0, Lde/up/cs/mapawo/ms/memonemo/MainActivity;->notesView:Landroid/widget/ListView;

    new-instance v2, Lde/up/cs/mapawo/ms/memonemo/MainActivity$1;

    invoke-direct {v2, p0}, Lde/up/cs/mapawo/ms/memonemo/MainActivity$1;-><init>(Lde/up/cs/mapawo/ms/memonemo/MainActivity;)V

    invoke-virtual {v1, v2}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 55
    invoke-virtual {p0}, Lde/up/cs/mapawo/ms/memonemo/MainActivity;->loadNotesList()V

    .line 56
    return-void

    nop

    :array_0
    .array-data 4
        0x1020014
        0x1020015
    .end array-data
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 2
    .param p1, "menu"    # Landroid/view/Menu;

    .line 132
    invoke-virtual {p0}, Lde/up/cs/mapawo/ms/memonemo/MainActivity;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v0

    const v1, 0x7f0c0001

    invoke-virtual {v0, v1, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 133
    const/4 v0, 0x1

    return v0
.end method

.method public onNewButton(Landroid/view/View;)V
    .locals 4
    .param p1, "view"    # Landroid/view/View;

    .line 65
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lde/up/cs/mapawo/ms/memonemo/EditActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 67
    .local v0, "newIntent":Landroid/content/Intent;
    const-string v1, "action"

    const-string v2, "new"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 68
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "nemo."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v2, ".memo"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "filename"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 69
    invoke-virtual {p0, v0}, Lde/up/cs/mapawo/ms/memonemo/MainActivity;->startActivity(Landroid/content/Intent;)V

    .line 70
    return-void
.end method

.method public onNoteClick(Landroid/view/View;IJ)V
    .locals 5
    .param p1, "view"    # Landroid/view/View;
    .param p2, "pos"    # I
    .param p3, "id"    # J

    .line 74
    iget-object v0, p0, Lde/up/cs/mapawo/ms/memonemo/MainActivity;->notesList:Ljava/util/ArrayList;

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    const-string v1, "filename"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 75
    .local v0, "fname":Ljava/lang/String;
    new-instance v2, Landroid/content/Intent;

    const-class v3, Lde/up/cs/mapawo/ms/memonemo/EditActivity;

    invoke-direct {v2, p0, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 77
    .local v2, "editIntent":Landroid/content/Intent;
    const-string v3, "action"

    const-string v4, "edit"

    invoke-virtual {v2, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 78
    invoke-virtual {v2, v1, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 79
    invoke-virtual {p0, v2}, Lde/up/cs/mapawo/ms/memonemo/MainActivity;->startActivity(Landroid/content/Intent;)V

    .line 80
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 5
    .param p1, "item"    # Landroid/view/MenuItem;

    .line 141
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    .line 144
    .local v0, "id":I
    const/4 v1, 0x1

    const v2, 0x7f080036

    if-ne v0, v2, :cond_0

    .line 145
    invoke-virtual {p0}, Lde/up/cs/mapawo/ms/memonemo/MainActivity;->dbgDelete()V

    .line 146
    return v1

    .line 148
    :cond_0
    const v2, 0x7f080035

    if-ne v0, v2, :cond_1

    .line 150
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "nemo."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v3, ".memo"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lde/up/cs/mapawo/ms/memonemo/MainActivity;->testSave(Ljava/lang/String;)V

    .line 151
    return v1

    .line 159
    :cond_1
    invoke-super {p0, p1}, Landroid/support/v7/app/AppCompatActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v1

    return v1
.end method

.method public onResume()V
    .locals 0

    .line 60
    invoke-super {p0}, Landroid/support/v7/app/AppCompatActivity;->onResume()V

    .line 61
    invoke-virtual {p0}, Lde/up/cs/mapawo/ms/memonemo/MainActivity;->loadNotesList()V

    .line 62
    return-void
.end method

.method public testSave(Ljava/lang/String;)V
    .locals 3
    .param p1, "fileName"    # Ljava/lang/String;

    .line 168
    :try_start_0
    new-instance v0, Ljava/io/OutputStreamWriter;

    const/4 v1, 0x0

    invoke-virtual {p0, p1, v1}, Lde/up/cs/mapawo/ms/memonemo/MainActivity;->openFileOutput(Ljava/lang/String;I)Ljava/io/FileOutputStream;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;)V

    .line 169
    .local v0, "out":Ljava/io/OutputStreamWriter;
    const v2, 0x7f0e003f

    invoke-virtual {p0, v2}, Lde/up/cs/mapawo/ms/memonemo/MainActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;)V

    .line 170
    invoke-virtual {v0}, Ljava/io/OutputStreamWriter;->close()V

    .line 172
    const-string v2, "Note created!"

    invoke-static {p0, v2, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 175
    .end local v0    # "out":Ljava/io/OutputStreamWriter;
    goto :goto_0

    .line 173
    :catch_0
    move-exception v0

    .line 174
    .local v0, "t":Ljava/lang/Throwable;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Exception: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x1

    invoke-static {p0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 177
    .end local v0    # "t":Ljava/lang/Throwable;
    :goto_0
    invoke-virtual {p0}, Lde/up/cs/mapawo/ms/memonemo/MainActivity;->loadNotesList()V

    .line 178
    return-void
.end method
