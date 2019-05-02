.class Lde/up/cs/mapawo/ms/memonemo/MainActivity$1;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lde/up/cs/mapawo/ms/memonemo/MainActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lde/up/cs/mapawo/ms/memonemo/MainActivity;


# direct methods
.method constructor <init>(Lde/up/cs/mapawo/ms/memonemo/MainActivity;)V
    .locals 0
    .param p1, "this$0"    # Lde/up/cs/mapawo/ms/memonemo/MainActivity;

    .line 46
    iput-object p1, p0, Lde/up/cs/mapawo/ms/memonemo/MainActivity$1;->this$0:Lde/up/cs/mapawo/ms/memonemo/MainActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 1
    .param p2, "view"    # Landroid/view/View;
    .param p3, "position"    # I
    .param p4, "id"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView<",
            "*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .line 49
    .local p1, "parent":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    iget-object v0, p0, Lde/up/cs/mapawo/ms/memonemo/MainActivity$1;->this$0:Lde/up/cs/mapawo/ms/memonemo/MainActivity;

    invoke-virtual {v0, p2, p3, p4, p5}, Lde/up/cs/mapawo/ms/memonemo/MainActivity;->onNoteClick(Landroid/view/View;IJ)V

    .line 50
    return-void
.end method
