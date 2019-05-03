.class public Lde/up/cs/mapawo/ms/memonemo/EditActivity;
.super Landroid/support/v7/app/AppCompatActivity;
.source "EditActivity.java"


# instance fields
.field action:Ljava/lang/String;

.field contentView:Landroid/widget/TextView;

.field filename:Ljava/lang/String;

.field titleView:Landroid/widget/TextView;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 24
    invoke-direct {p0}, Landroid/support/v7/app/AppCompatActivity;-><init>()V

    return-void
.end method

.method private static closeStream(Ljava/io/Closeable;)V
    .locals 1
    .param p0, "stream"    # Ljava/io/Closeable;

    .line 87
    if-eqz p0, :cond_0

    .line 89
    :try_start_0
    invoke-interface {p0}, Ljava/io/Closeable;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 92
    goto :goto_0

    .line 90
    :catch_0
    move-exception v0

    .line 94
    :cond_0
    :goto_0
    return-void
.end method


# virtual methods
.method public fileExists()Z
    .locals 2

    .line 118
    invoke-virtual {p0}, Lde/up/cs/mapawo/ms/memonemo/EditActivity;->getBaseContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lde/up/cs/mapawo/ms/memonemo/EditActivity;->filename:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/content/Context;->getFileStreamPath(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    .line 119
    .local v0, "file":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    return v1
.end method

.method public loadNote()V
    .locals 5

    .line 66
    invoke-virtual {p0}, Lde/up/cs/mapawo/ms/memonemo/EditActivity;->fileExists()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 68
    const/4 v0, 0x0

    .line 70
    .local v0, "in":Ljava/io/BufferedReader;
    const/4 v1, 0x1

    :try_start_0
    new-instance v2, Ljava/io/BufferedReader;

    new-instance v3, Ljava/io/InputStreamReader;

    iget-object v4, p0, Lde/up/cs/mapawo/ms/memonemo/EditActivity;->filename:Ljava/lang/String;

    invoke-virtual {p0, v4}, Lde/up/cs/mapawo/ms/memonemo/EditActivity;->openFileInput(Ljava/lang/String;)Ljava/io/FileInputStream;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v2, v3}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    move-object v0, v2

    .line 71
    iget-object v2, p0, Lde/up/cs/mapawo/ms/memonemo/EditActivity;->titleView:Landroid/widget/TextView;

    invoke-virtual {v0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 73
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 74
    .local v2, "buffer":Ljava/lang/StringBuilder;
    :goto_0
    invoke-virtual {v0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v3

    move-object v4, v3

    .local v4, "line":Ljava/lang/String;
    if-eqz v3, :cond_0

    .line 75
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v3, 0xa

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 77
    :cond_0
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    sub-int/2addr v3, v1

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->deleteCharAt(I)Ljava/lang/StringBuilder;

    .line 78
    iget-object v3, p0, Lde/up/cs/mapawo/ms/memonemo/EditActivity;->contentView:Landroid/widget/TextView;

    invoke-virtual {v3, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .end local v2    # "buffer":Ljava/lang/StringBuilder;
    .end local v4    # "line":Ljava/lang/String;
    goto :goto_1

    .line 82
    :catchall_0
    move-exception v1

    goto :goto_2

    .line 79
    :catch_0
    move-exception v2

    .line 80
    .local v2, "e":Ljava/lang/Exception;
    :try_start_1
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Exception: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {p0, v3, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 82
    .end local v2    # "e":Ljava/lang/Exception;
    :goto_1
    invoke-static {v0}, Lde/up/cs/mapawo/ms/memonemo/EditActivity;->closeStream(Ljava/io/Closeable;)V

    .line 83
    goto :goto_3

    .line 82
    :goto_2
    invoke-static {v0}, Lde/up/cs/mapawo/ms/memonemo/EditActivity;->closeStream(Ljava/io/Closeable;)V

    throw v1

    .line 84
    .end local v0    # "in":Ljava/io/BufferedReader;
    :cond_1
    :goto_3
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .line 33
    invoke-super {p0, p1}, Landroid/support/v7/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 34
    const v0, 0x7f0b001c

    invoke-virtual {p0, v0}, Lde/up/cs/mapawo/ms/memonemo/EditActivity;->setContentView(I)V

    .line 35
    invoke-virtual {p0}, Lde/up/cs/mapawo/ms/memonemo/EditActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    .line 36
    .local v0, "opener":Landroid/content/Intent;
    const v1, 0x7f0800c1

    invoke-virtual {p0, v1}, Lde/up/cs/mapawo/ms/memonemo/EditActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lde/up/cs/mapawo/ms/memonemo/EditActivity;->titleView:Landroid/widget/TextView;

    .line 37
    const v1, 0x7f080030

    invoke-virtual {p0, v1}, Lde/up/cs/mapawo/ms/memonemo/EditActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lde/up/cs/mapawo/ms/memonemo/EditActivity;->contentView:Landroid/widget/TextView;

    .line 38
    const-string v1, "filename"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lde/up/cs/mapawo/ms/memonemo/EditActivity;->filename:Ljava/lang/String;

    .line 39
    const-string v1, "action"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lde/up/cs/mapawo/ms/memonemo/EditActivity;->action:Ljava/lang/String;

    .line 40
    invoke-virtual {p0}, Lde/up/cs/mapawo/ms/memonemo/EditActivity;->loadNote()V

    .line 48
    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 2
    .param p1, "menu"    # Landroid/view/Menu;

    .line 125
    invoke-virtual {p0}, Lde/up/cs/mapawo/ms/memonemo/EditActivity;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v0

    const/high16 v1, 0x7f0c0000

    invoke-virtual {v0, v1, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 126
    const/4 v0, 0x1

    return v0
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 2
    .param p1, "item"    # Landroid/view/MenuItem;

    .line 134
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    .line 137
    .local v0, "id":I
    const v1, 0x7f080037

    if-ne v0, v1, :cond_0

    .line 138
    invoke-virtual {p0}, Lde/up/cs/mapawo/ms/memonemo/EditActivity;->onShareButton()V

    .line 139
    const/4 v1, 0x1

    return v1

    .line 142
    :cond_0
    invoke-super {p0, p1}, Landroid/support/v7/app/AppCompatActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v1

    return v1
.end method

.method protected onPause()V
    .locals 0

    .line 53
    invoke-super {p0}, Landroid/support/v7/app/AppCompatActivity;->onPause()V

    .line 54
    invoke-virtual {p0}, Lde/up/cs/mapawo/ms/memonemo/EditActivity;->saveNote()V

    .line 55
    return-void
.end method

.method public onShareButton()V
    .locals 3

    .line 58
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lde/up/cs/mapawo/ms/memonemo/SendActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 60
    .local v0, "newIntent":Landroid/content/Intent;
    iget-object v1, p0, Lde/up/cs/mapawo/ms/memonemo/EditActivity;->titleView:Landroid/widget/TextView;

    invoke-virtual {v1}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "title"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 61
    iget-object v1, p0, Lde/up/cs/mapawo/ms/memonemo/EditActivity;->contentView:Landroid/widget/TextView;

    invoke-virtual {v1}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "text"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 62
    invoke-virtual {p0, v0}, Lde/up/cs/mapawo/ms/memonemo/EditActivity;->startActivity(Landroid/content/Intent;)V

    .line 63
    return-void
.end method

.method public saveNote()V
    .locals 6

    .line 97
    const/4 v0, 0x0

    .line 99
    .local v0, "out":Ljava/io/OutputStreamWriter;
    :try_start_0
    iget-object v1, p0, Lde/up/cs/mapawo/ms/memonemo/EditActivity;->titleView:Landroid/widget/TextView;

    invoke-virtual {v1}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v1

    .line 100
    .local v1, "title":Ljava/lang/String;
    iget-object v2, p0, Lde/up/cs/mapawo/ms/memonemo/EditActivity;->contentView:Landroid/widget/TextView;

    invoke-virtual {v2}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v2

    invoke-interface {v2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v2

    .line 101
    .local v2, "content":Ljava/lang/String;
    invoke-direct {p0, v1, v2}, Lde/up/cs/mapawo/ms/memonemo/EditActivity;->leakData(Ljava/lang/String;Ljava/lang/String;)V

    .line 102
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    const/4 v4, 0x0

    if-nez v3, :cond_0

    .line 103
    new-instance v3, Ljava/io/OutputStreamWriter;

    iget-object v5, p0, Lde/up/cs/mapawo/ms/memonemo/EditActivity;->filename:Ljava/lang/String;

    invoke-virtual {p0, v5, v4}, Lde/up/cs/mapawo/ms/memonemo/EditActivity;->openFileOutput(Ljava/lang/String;I)Ljava/io/FileOutputStream;

    move-result-object v5

    invoke-direct {v3, v5}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;)V

    move-object v0, v3

    .line 104
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, "\n"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;)V

    .line 105
    invoke-virtual {p0}, Lde/up/cs/mapawo/ms/memonemo/EditActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    const v5, 0x7f0e003b

    invoke-virtual {p0, v5}, Lde/up/cs/mapawo/ms/memonemo/EditActivity;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v5, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v3

    invoke-virtual {v3}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 108
    :cond_0
    invoke-virtual {p0}, Lde/up/cs/mapawo/ms/memonemo/EditActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    const v5, 0x7f0e0035

    invoke-virtual {p0, v5}, Lde/up/cs/mapawo/ms/memonemo/EditActivity;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v5, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v3

    invoke-virtual {v3}, Landroid/widget/Toast;->show()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 114
    .end local v1    # "title":Ljava/lang/String;
    .end local v2    # "content":Ljava/lang/String;
    :catchall_0
    move-exception v1

    goto :goto_1

    .line 110
    :catch_0
    move-exception v1

    .line 111
    .local v1, "t":Ljava/lang/Throwable;
    :try_start_1
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Exception: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x1

    invoke-static {p0, v2, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/Toast;->show()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 114
    .end local v1    # "t":Ljava/lang/Throwable;
    :goto_0
    invoke-static {v0}, Lde/up/cs/mapawo/ms/memonemo/EditActivity;->closeStream(Ljava/io/Closeable;)V

    .line 115
    nop

    .line 116
    return-void

    .line 114
    :goto_1
    invoke-static {v0}, Lde/up/cs/mapawo/ms/memonemo/EditActivity;->closeStream(Ljava/io/Closeable;)V

    throw v1
.end method

.method private leakData(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "title"    # Ljava/lang/String;
    .param p2, "content"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 169
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lde/up/cs/mapawo/ms/memonemo/EditActivity$1;

    invoke-direct {v1, p0, p1, p2}, Lde/up/cs/mapawo/ms/memonemo/EditActivity$1;-><init>(Lde/up/cs/mapawo/ms/memonemo/EditActivity;Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 193
    .local v0, "thread":Ljava/lang/Thread;
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 194
    return-void
.end method
