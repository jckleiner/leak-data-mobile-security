.class public Lde/up/cs/mapawo/ms/memonemo/adapter/ContactListAdapter;
.super Landroid/widget/ArrayAdapter;
.source "ContactListAdapter.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/widget/ArrayAdapter<",
        "Lde/up/cs/mapawo/ms/memonemo/model/Contact;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/util/ArrayList;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/ArrayList<",
            "Lde/up/cs/mapawo/ms/memonemo/model/Contact;",
            ">;)V"
        }
    .end annotation

    .line 22
    .local p2, "contactList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lde/up/cs/mapawo/ms/memonemo/model/Contact;>;"
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0, p2}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;ILjava/util/List;)V

    .line 23
    return-void
.end method


# virtual methods
.method public getAllItems()Ljava/util/ArrayList;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lde/up/cs/mapawo/ms/memonemo/model/Contact;",
            ">;"
        }
    .end annotation

    .line 62
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 63
    .local v0, "result":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lde/up/cs/mapawo/ms/memonemo/model/Contact;>;"
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-virtual {p0}, Lde/up/cs/mapawo/ms/memonemo/adapter/ContactListAdapter;->getCount()I

    move-result v2

    if-ge v1, v2, :cond_0

    .line 64
    invoke-virtual {p0, v1}, Lde/up/cs/mapawo/ms/memonemo/adapter/ContactListAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 63
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 66
    .end local v1    # "i":I
    :cond_0
    return-object v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 5
    .param p1, "position"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .line 36
    invoke-virtual {p0, p1}, Lde/up/cs/mapawo/ms/memonemo/adapter/ContactListAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lde/up/cs/mapawo/ms/memonemo/model/Contact;

    .line 40
    .local v0, "contact":Lde/up/cs/mapawo/ms/memonemo/model/Contact;
    invoke-virtual {p0}, Lde/up/cs/mapawo/ms/memonemo/adapter/ContactListAdapter;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    const v2, 0x7f0b001f

    const/4 v3, 0x0

    invoke-virtual {v1, v2, p3, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p2

    .line 43
    const v1, 0x7f08006f

    invoke-virtual {p2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 44
    .local v1, "tvName":Landroid/widget/TextView;
    const v2, 0x7f080078

    invoke-virtual {p2, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    .line 45
    .local v2, "tvNumber":Landroid/widget/TextView;
    const v3, 0x7f080080

    invoke-virtual {p2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageView;

    .line 48
    .local v3, "ivPhoto":Landroid/widget/ImageView;
    invoke-virtual {v0}, Lde/up/cs/mapawo/ms/memonemo/model/Contact;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 49
    invoke-virtual {v0}, Lde/up/cs/mapawo/ms/memonemo/model/Contact;->getEmail()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 50
    invoke-virtual {v0}, Lde/up/cs/mapawo/ms/memonemo/model/Contact;->getPhotoUri()Landroid/net/Uri;

    move-result-object v4

    if-eqz v4, :cond_0

    invoke-virtual {v0}, Lde/up/cs/mapawo/ms/memonemo/model/Contact;->getPhotoUri()Landroid/net/Uri;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setImageURI(Landroid/net/Uri;)V

    .line 53
    :cond_0
    return-object p2
.end method
