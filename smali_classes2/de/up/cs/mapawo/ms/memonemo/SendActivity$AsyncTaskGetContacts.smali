.class Lde/up/cs/mapawo/ms/memonemo/SendActivity$AsyncTaskGetContacts;
.super Landroid/os/AsyncTask;
.source "SendActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lde/up/cs/mapawo/ms/memonemo/SendActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "AsyncTaskGetContacts"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Ljava/util/ArrayList<",
        "Lde/up/cs/mapawo/ms/memonemo/model/Contact;",
        ">;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lde/up/cs/mapawo/ms/memonemo/SendActivity;


# direct methods
.method constructor <init>(Lde/up/cs/mapawo/ms/memonemo/SendActivity;)V
    .locals 0
    .param p1, "this$0"    # Lde/up/cs/mapawo/ms/memonemo/SendActivity;

    .line 178
    iput-object p1, p0, Lde/up/cs/mapawo/ms/memonemo/SendActivity$AsyncTaskGetContacts;->this$0:Lde/up/cs/mapawo/ms/memonemo/SendActivity;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method


# virtual methods
.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 178
    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lde/up/cs/mapawo/ms/memonemo/SendActivity$AsyncTaskGetContacts;->doInBackground([Ljava/lang/Void;)Ljava/util/ArrayList;

    move-result-object p1

    return-object p1
.end method

.method protected varargs doInBackground([Ljava/lang/Void;)Ljava/util/ArrayList;
    .locals 1
    .param p1, "params"    # [Ljava/lang/Void;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/Void;",
            ")",
            "Ljava/util/ArrayList<",
            "Lde/up/cs/mapawo/ms/memonemo/model/Contact;",
            ">;"
        }
    .end annotation

    .line 188
    iget-object v0, p0, Lde/up/cs/mapawo/ms/memonemo/SendActivity$AsyncTaskGetContacts;->this$0:Lde/up/cs/mapawo/ms/memonemo/SendActivity;

    invoke-virtual {v0}, Lde/up/cs/mapawo/ms/memonemo/SendActivity;->getContacts()Ljava/util/ArrayList;

    move-result-object v0

    .line 189
    .local v0, "contacts":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lde/up/cs/mapawo/ms/memonemo/model/Contact;>;"
    return-object v0
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .line 178
    check-cast p1, Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Lde/up/cs/mapawo/ms/memonemo/SendActivity$AsyncTaskGetContacts;->onPostExecute(Ljava/util/ArrayList;)V

    return-void
.end method

.method protected onPostExecute(Ljava/util/ArrayList;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lde/up/cs/mapawo/ms/memonemo/model/Contact;",
            ">;)V"
        }
    .end annotation

    .line 207
    .local p1, "result":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lde/up/cs/mapawo/ms/memonemo/model/Contact;>;"
    invoke-virtual {p1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 208
    iget-object v0, p0, Lde/up/cs/mapawo/ms/memonemo/SendActivity$AsyncTaskGetContacts;->this$0:Lde/up/cs/mapawo/ms/memonemo/SendActivity;

    invoke-virtual {v0}, Lde/up/cs/mapawo/ms/memonemo/SendActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lde/up/cs/mapawo/ms/memonemo/SendActivity$AsyncTaskGetContacts;->this$0:Lde/up/cs/mapawo/ms/memonemo/SendActivity;

    const v2, 0x7f0e002e

    invoke-virtual {v1, v2}, Lde/up/cs/mapawo/ms/memonemo/SendActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 209
    iget-object v0, p0, Lde/up/cs/mapawo/ms/memonemo/SendActivity$AsyncTaskGetContacts;->this$0:Lde/up/cs/mapawo/ms/memonemo/SendActivity;

    invoke-virtual {v0}, Lde/up/cs/mapawo/ms/memonemo/SendActivity;->finish()V

    .line 211
    :cond_0
    new-instance v0, Lde/up/cs/mapawo/ms/memonemo/adapter/ContactListAdapter;

    iget-object v1, p0, Lde/up/cs/mapawo/ms/memonemo/SendActivity$AsyncTaskGetContacts;->this$0:Lde/up/cs/mapawo/ms/memonemo/SendActivity;

    invoke-direct {v0, v1, p1}, Lde/up/cs/mapawo/ms/memonemo/adapter/ContactListAdapter;-><init>(Landroid/content/Context;Ljava/util/ArrayList;)V

    .line 212
    .local v0, "contactAdapter":Lde/up/cs/mapawo/ms/memonemo/adapter/ContactListAdapter;
    iget-object v1, p0, Lde/up/cs/mapawo/ms/memonemo/SendActivity$AsyncTaskGetContacts;->this$0:Lde/up/cs/mapawo/ms/memonemo/SendActivity;

    invoke-virtual {v1, v0}, Lde/up/cs/mapawo/ms/memonemo/SendActivity;->setListAdapter(Landroid/widget/ListAdapter;)V

    .line 213
    return-void
.end method

.method protected onPreExecute()V
    .locals 0

    .line 198
    invoke-super {p0}, Landroid/os/AsyncTask;->onPreExecute()V

    .line 199
    return-void
.end method
