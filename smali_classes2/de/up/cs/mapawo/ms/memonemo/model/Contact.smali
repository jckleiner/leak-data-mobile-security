.class public Lde/up/cs/mapawo/ms/memonemo/model/Contact;
.super Ljava/lang/Object;
.source "Contact.java"


# instance fields
.field private email:Ljava/lang/String;

.field private id:Ljava/lang/String;

.field private image:Landroid/graphics/Bitmap;

.field private name:Ljava/lang/String;

.field private number:Ljava/lang/String;

.field private photoUri:Landroid/net/Uri;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/graphics/Bitmap;Landroid/net/Uri;Ljava/lang/String;)V
    .locals 0
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "number"    # Ljava/lang/String;
    .param p4, "image"    # Landroid/graphics/Bitmap;
    .param p5, "photoUri"    # Landroid/net/Uri;
    .param p6, "email"    # Ljava/lang/String;

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    iput-object p1, p0, Lde/up/cs/mapawo/ms/memonemo/model/Contact;->id:Ljava/lang/String;

    .line 27
    iput-object p2, p0, Lde/up/cs/mapawo/ms/memonemo/model/Contact;->name:Ljava/lang/String;

    .line 28
    iput-object p3, p0, Lde/up/cs/mapawo/ms/memonemo/model/Contact;->number:Ljava/lang/String;

    .line 29
    iput-object p4, p0, Lde/up/cs/mapawo/ms/memonemo/model/Contact;->image:Landroid/graphics/Bitmap;

    .line 30
    iput-object p5, p0, Lde/up/cs/mapawo/ms/memonemo/model/Contact;->photoUri:Landroid/net/Uri;

    .line 31
    iput-object p6, p0, Lde/up/cs/mapawo/ms/memonemo/model/Contact;->email:Ljava/lang/String;

    .line 32
    return-void
.end method


# virtual methods
.method public getEmail()Ljava/lang/String;
    .locals 1

    .line 115
    iget-object v0, p0, Lde/up/cs/mapawo/ms/memonemo/model/Contact;->email:Ljava/lang/String;

    return-object v0
.end method

.method public getId()Ljava/lang/String;
    .locals 1

    .line 39
    iget-object v0, p0, Lde/up/cs/mapawo/ms/memonemo/model/Contact;->id:Ljava/lang/String;

    return-object v0
.end method

.method public getImage()Landroid/graphics/Bitmap;
    .locals 1

    .line 87
    iget-object v0, p0, Lde/up/cs/mapawo/ms/memonemo/model/Contact;->image:Landroid/graphics/Bitmap;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .line 55
    iget-object v0, p0, Lde/up/cs/mapawo/ms/memonemo/model/Contact;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getNumber()Ljava/lang/String;
    .locals 1

    .line 71
    iget-object v0, p0, Lde/up/cs/mapawo/ms/memonemo/model/Contact;->number:Ljava/lang/String;

    return-object v0
.end method

.method public getPhotoUri()Landroid/net/Uri;
    .locals 1

    .line 103
    iget-object v0, p0, Lde/up/cs/mapawo/ms/memonemo/model/Contact;->photoUri:Landroid/net/Uri;

    return-object v0
.end method

.method public setEmail(Ljava/lang/String;)V
    .locals 0
    .param p1, "email"    # Ljava/lang/String;

    .line 119
    iput-object p1, p0, Lde/up/cs/mapawo/ms/memonemo/model/Contact;->email:Ljava/lang/String;

    .line 120
    return-void
.end method

.method public setId(Ljava/lang/String;)V
    .locals 0
    .param p1, "id"    # Ljava/lang/String;

    .line 47
    iput-object p1, p0, Lde/up/cs/mapawo/ms/memonemo/model/Contact;->id:Ljava/lang/String;

    .line 48
    return-void
.end method

.method public setImage(Landroid/graphics/Bitmap;)V
    .locals 0
    .param p1, "image"    # Landroid/graphics/Bitmap;

    .line 95
    iput-object p1, p0, Lde/up/cs/mapawo/ms/memonemo/model/Contact;->image:Landroid/graphics/Bitmap;

    .line 96
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;

    .line 63
    iput-object p1, p0, Lde/up/cs/mapawo/ms/memonemo/model/Contact;->name:Ljava/lang/String;

    .line 64
    return-void
.end method

.method public setNumber(Ljava/lang/String;)V
    .locals 0
    .param p1, "number"    # Ljava/lang/String;

    .line 79
    iput-object p1, p0, Lde/up/cs/mapawo/ms/memonemo/model/Contact;->number:Ljava/lang/String;

    .line 80
    return-void
.end method

.method public setPhotoUri(Landroid/net/Uri;)V
    .locals 0
    .param p1, "photoUri"    # Landroid/net/Uri;

    .line 111
    iput-object p1, p0, Lde/up/cs/mapawo/ms/memonemo/model/Contact;->photoUri:Landroid/net/Uri;

    .line 112
    return-void
.end method
