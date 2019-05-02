.class public Lde/up/cs/mapawo/ms/memonemo/SendActivity;
.super Landroid/app/ListActivity;
.source "SendActivity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lde/up/cs/mapawo/ms/memonemo/SendActivity$AsyncTaskGetContacts;
    }
.end annotation


# static fields
.field private static final REQUEST_READ_CONTACTS:I = 0x1


# instance fields
.field private text:Ljava/lang/String;

.field private title:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 33
    invoke-direct {p0}, Landroid/app/ListActivity;-><init>()V

    return-void
.end method


# virtual methods
.method public getContacts()Ljava/util/ArrayList;
    .locals 22
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lde/up/cs/mapawo/ms/memonemo/model/Contact;",
            ">;"
        }
    .end annotation

    .line 112
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 113
    .local v0, "contacts":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lde/up/cs/mapawo/ms/memonemo/model/Contact;>;"
    invoke-virtual/range {p0 .. p0}, Lde/up/cs/mapawo/ms/memonemo/SendActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v7

    .line 114
    .local v7, "contentResolver":Landroid/content/ContentResolver;
    sget-object v2, Landroid/provider/ContactsContract$Contacts;->CONTENT_URI:Landroid/net/Uri;

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object v1, v7

    invoke-virtual/range {v1 .. v6}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v8

    .line 115
    .local v8, "cursor":Landroid/database/Cursor;
    invoke-interface {v8}, Landroid/database/Cursor;->getCount()I

    move-result v1

    if-lez v1, :cond_5

    .line 116
    :goto_0
    invoke-interface {v8}, Landroid/database/Cursor;->moveToNext()Z

    move-result v1

    if-eqz v1, :cond_5

    .line 117
    const-string v1, "_id"

    invoke-interface {v8, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v8, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v16

    .line 118
    .local v16, "id":Ljava/lang/String;
    const-string v9, ""

    .local v9, "name":Ljava/lang/String;
    const-string v10, ""

    .local v10, "email":Ljava/lang/String;
    const-string v11, ""

    .line 119
    .local v11, "number":Ljava/lang/String;
    const-string v1, "has_phone_number"

    invoke-interface {v8, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v8, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    if-lez v1, :cond_4

    .line 120
    sget-object v2, Landroid/provider/ContactsContract$CommonDataKinds$Phone;->CONTENT_URI:Landroid/net/Uri;

    const/4 v3, 0x0

    const/4 v12, 0x1

    new-array v5, v12, [Ljava/lang/String;

    const/4 v13, 0x0

    aput-object v16, v5, v13

    const/4 v6, 0x0

    const-string v4, "contact_id = ?"

    move-object v1, v7

    invoke-virtual/range {v1 .. v6}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v15

    .line 122
    .local v15, "cursorInfo":Landroid/database/Cursor;
    invoke-virtual/range {p0 .. p0}, Lde/up/cs/mapawo/ms/memonemo/SendActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    sget-object v2, Landroid/provider/ContactsContract$Contacts;->CONTENT_URI:Landroid/net/Uri;

    invoke-static/range {v16 .. v16}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    move-result-wide v3

    invoke-static {v2, v3, v4}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/provider/ContactsContract$Contacts;->openContactPhotoInputStream(Landroid/content/ContentResolver;Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object v14

    .line 124
    .local v14, "is":Ljava/io/InputStream;
    sget-object v1, Landroid/provider/ContactsContract$Contacts;->CONTENT_URI:Landroid/net/Uri;

    invoke-static/range {v16 .. v16}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    invoke-static {v1, v2, v3}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v6

    .line 125
    .local v6, "person":Landroid/net/Uri;
    const-string v1, "photo"

    invoke-static {v6, v1}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v17

    .line 128
    .local v17, "pURI":Landroid/net/Uri;
    if-eqz v14, :cond_0

    .line 129
    new-instance v1, Ljava/io/BufferedInputStream;

    invoke-direct {v1, v14}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    invoke-static {v1}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;)Landroid/graphics/Bitmap;

    move-result-object v1

    move-object/from16 v20, v1

    move-object/from16 v18, v9

    move-object/from16 v19, v11

    .local v1, "photo":Landroid/graphics/Bitmap;
    goto :goto_1

    .line 131
    .end local v1    # "photo":Landroid/graphics/Bitmap;
    :cond_0
    invoke-virtual/range {p0 .. p0}, Lde/up/cs/mapawo/ms/memonemo/SendActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f07006a

    invoke-static {v1, v2}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object v1

    move-object/from16 v20, v1

    move-object/from16 v18, v9

    move-object/from16 v19, v11

    .line 133
    .end local v9    # "name":Ljava/lang/String;
    .end local v11    # "number":Ljava/lang/String;
    .local v18, "name":Ljava/lang/String;
    .local v19, "number":Ljava/lang/String;
    .local v20, "photo":Landroid/graphics/Bitmap;
    :goto_1
    invoke-interface {v15}, Landroid/database/Cursor;->moveToNext()Z

    move-result v1

    const-string v9, "data1"

    if-eqz v1, :cond_1

    .line 134
    const-string v1, "display_name"

    invoke-interface {v8, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v8, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v18

    .line 135
    invoke-interface {v15, v9}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v15, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v19

    goto :goto_1

    .line 137
    :cond_1
    sget-object v2, Landroid/provider/ContactsContract$CommonDataKinds$Email;->CONTENT_URI:Landroid/net/Uri;

    const/4 v3, 0x0

    new-array v5, v12, [Ljava/lang/String;

    aput-object v16, v5, v13

    const/4 v11, 0x0

    const-string v4, "contact_id = ?"

    move-object v1, v7

    move-object/from16 v21, v6

    .end local v6    # "person":Landroid/net/Uri;
    .local v21, "person":Landroid/net/Uri;
    move-object v6, v11

    invoke-virtual/range {v1 .. v6}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1

    move-object v2, v10

    .line 141
    .end local v10    # "email":Ljava/lang/String;
    .local v1, "emails":Landroid/database/Cursor;
    .local v2, "email":Ljava/lang/String;
    :goto_2
    invoke-interface {v1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 142
    invoke-interface {v1, v9}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v3

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    goto :goto_2

    .line 144
    :cond_2
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 145
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_3

    new-instance v3, Lde/up/cs/mapawo/ms/memonemo/model/Contact;

    move-object v9, v3

    move-object/from16 v10, v16

    move-object/from16 v11, v18

    move-object/from16 v12, v19

    move-object/from16 v13, v20

    move-object v4, v14

    .end local v14    # "is":Ljava/io/InputStream;
    .local v4, "is":Ljava/io/InputStream;
    move-object/from16 v14, v17

    move-object v5, v15

    .end local v15    # "cursorInfo":Landroid/database/Cursor;
    .local v5, "cursorInfo":Landroid/database/Cursor;
    move-object v15, v2

    invoke-direct/range {v9 .. v15}, Lde/up/cs/mapawo/ms/memonemo/model/Contact;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/graphics/Bitmap;Landroid/net/Uri;Ljava/lang/String;)V

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_3

    .end local v4    # "is":Ljava/io/InputStream;
    .end local v5    # "cursorInfo":Landroid/database/Cursor;
    .restart local v14    # "is":Ljava/io/InputStream;
    .restart local v15    # "cursorInfo":Landroid/database/Cursor;
    :cond_3
    move-object v4, v14

    move-object v5, v15

    .line 146
    .end local v14    # "is":Ljava/io/InputStream;
    .end local v15    # "cursorInfo":Landroid/database/Cursor;
    .restart local v4    # "is":Ljava/io/InputStream;
    .restart local v5    # "cursorInfo":Landroid/database/Cursor;
    :goto_3
    invoke-interface {v5}, Landroid/database/Cursor;->close()V

    .line 148
    .end local v1    # "emails":Landroid/database/Cursor;
    .end local v2    # "email":Ljava/lang/String;
    .end local v4    # "is":Ljava/io/InputStream;
    .end local v5    # "cursorInfo":Landroid/database/Cursor;
    .end local v16    # "id":Ljava/lang/String;
    .end local v17    # "pURI":Landroid/net/Uri;
    .end local v18    # "name":Ljava/lang/String;
    .end local v19    # "number":Ljava/lang/String;
    .end local v20    # "photo":Landroid/graphics/Bitmap;
    .end local v21    # "person":Landroid/net/Uri;
    :cond_4
    goto/16 :goto_0

    .line 150
    :cond_5
    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    .line 151
    return-object v0
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 4
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .line 45
    invoke-super {p0, p1}, Landroid/app/ListActivity;->onCreate(Landroid/os/Bundle;)V

    .line 46
    const v0, 0x7f0b001e

    invoke-virtual {p0, v0}, Lde/up/cs/mapawo/ms/memonemo/SendActivity;->setContentView(I)V

    .line 50
    const-string v0, "android.permission.READ_CONTACTS"

    invoke-static {p0, v0}, Landroid/support/v4/content/ContextCompat;->checkSelfPermission(Landroid/content/Context;Ljava/lang/String;)I

    move-result v1

    const/4 v2, 0x1

    if-eqz v1, :cond_1

    .line 56
    invoke-static {p0, v0}, Landroid/support/v4/app/ActivityCompat;->shouldShowRequestPermissionRationale(Landroid/app/Activity;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    .line 63
    :cond_0
    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0, v2}, Landroid/support/v4/app/ActivityCompat;->requestPermissions(Landroid/app/Activity;[Ljava/lang/String;I)V

    goto :goto_0

    .line 72
    :cond_1
    new-instance v0, Lde/up/cs/mapawo/ms/memonemo/SendActivity$AsyncTaskGetContacts;

    invoke-direct {v0, p0}, Lde/up/cs/mapawo/ms/memonemo/SendActivity$AsyncTaskGetContacts;-><init>(Lde/up/cs/mapawo/ms/memonemo/SendActivity;)V

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Lde/up/cs/mapawo/ms/memonemo/SendActivity$AsyncTaskGetContacts;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 74
    :goto_0
    invoke-virtual {p0}, Lde/up/cs/mapawo/ms/memonemo/SendActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "title"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    const-string v3, "text"

    if-nez v0, :cond_2

    invoke-virtual {p0}, Lde/up/cs/mapawo/ms/memonemo/SendActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 75
    :cond_2
    const v0, 0x7f0e0033

    invoke-virtual {p0, v0}, Lde/up/cs/mapawo/ms/memonemo/SendActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 76
    invoke-virtual {p0}, Lde/up/cs/mapawo/ms/memonemo/SendActivity;->finish()V

    .line 79
    :cond_3
    invoke-virtual {p0}, Lde/up/cs/mapawo/ms/memonemo/SendActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lde/up/cs/mapawo/ms/memonemo/SendActivity;->text:Ljava/lang/String;

    .line 80
    invoke-virtual {p0}, Lde/up/cs/mapawo/ms/memonemo/SendActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lde/up/cs/mapawo/ms/memonemo/SendActivity;->title:Ljava/lang/String;

    .line 81
    return-void
.end method

.method protected onListItemClick(Landroid/widget/ListView;Landroid/view/View;IJ)V
    .locals 5
    .param p1, "l"    # Landroid/widget/ListView;
    .param p2, "v"    # Landroid/view/View;
    .param p3, "position"    # I
    .param p4, "id"    # J

    .line 92
    invoke-virtual {p0}, Lde/up/cs/mapawo/ms/memonemo/SendActivity;->getListAdapter()Landroid/widget/ListAdapter;

    move-result-object v0

    invoke-interface {v0, p3}, Landroid/widget/ListAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lde/up/cs/mapawo/ms/memonemo/model/Contact;

    .line 93
    .local v0, "item":Lde/up/cs/mapawo/ms/memonemo/model/Contact;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "send to "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Lde/up/cs/mapawo/ms/memonemo/model/Contact;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x1

    invoke-static {p0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 94
    iget-object v1, p0, Lde/up/cs/mapawo/ms/memonemo/SendActivity;->title:Ljava/lang/String;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lde/up/cs/mapawo/ms/memonemo/SendActivity;->text:Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 95
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lde/up/cs/mapawo/ms/memonemo/SendActivity;->title:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "\n\n"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lde/up/cs/mapawo/ms/memonemo/SendActivity;->text:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 98
    :cond_0
    new-instance v1, Landroid/content/Intent;

    const-string v3, "android.intent.action.SEND"

    invoke-direct {v1, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 99
    .local v1, "emailIntent":Landroid/content/Intent;
    const-string v3, "plain/text"

    invoke-virtual {v1, v3}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 100
    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    invoke-virtual {v0}, Lde/up/cs/mapawo/ms/memonemo/model/Contact;->getEmail()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    const-string v3, "android.intent.extra.EMAIL"

    invoke-virtual {v1, v3, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[Ljava/lang/String;)Landroid/content/Intent;

    .line 101
    iget-object v2, p0, Lde/up/cs/mapawo/ms/memonemo/SendActivity;->title:Ljava/lang/String;

    const-string v3, "android.intent.extra.SUBJECT"

    invoke-virtual {v1, v3, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 102
    iget-object v2, p0, Lde/up/cs/mapawo/ms/memonemo/SendActivity;->text:Ljava/lang/String;

    const-string v3, "android.intent.extra.TEXT"

    invoke-virtual {v1, v3, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 103
    invoke-virtual {p0, v1}, Lde/up/cs/mapawo/ms/memonemo/SendActivity;->startActivity(Landroid/content/Intent;)V

    .line 104
    invoke-virtual {p0}, Lde/up/cs/mapawo/ms/memonemo/SendActivity;->finish()V

    .line 105
    return-void
.end method

.method public onRequestPermissionsResult(I[Ljava/lang/String;[I)V
    .locals 2
    .param p1, "requestCode"    # I
    .param p2, "permissions"    # [Ljava/lang/String;
    .param p3, "grantResults"    # [I

    .line 162
    const/4 v0, 0x1

    if-eq p1, v0, :cond_0

    .line 171
    invoke-super {p0, p1, p2, p3}, Landroid/app/ListActivity;->onRequestPermissionsResult(I[Ljava/lang/String;[I)V

    .line 173
    return-void

    .line 164
    :cond_0
    array-length v0, p3

    if-lez v0, :cond_1

    const/4 v0, 0x0

    aget v1, p3, v0

    if-nez v1, :cond_1

    .line 167
    new-instance v1, Lde/up/cs/mapawo/ms/memonemo/SendActivity$AsyncTaskGetContacts;

    invoke-direct {v1, p0}, Lde/up/cs/mapawo/ms/memonemo/SendActivity$AsyncTaskGetContacts;-><init>(Lde/up/cs/mapawo/ms/memonemo/SendActivity;)V

    new-array v0, v0, [Ljava/lang/Void;

    invoke-virtual {v1, v0}, Lde/up/cs/mapawo/ms/memonemo/SendActivity$AsyncTaskGetContacts;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 169
    :cond_1
    return-void
.end method
