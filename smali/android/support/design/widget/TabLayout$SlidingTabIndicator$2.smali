.class Landroid/support/design/widget/TabLayout$SlidingTabIndicator$2;
.super Landroid/animation/AnimatorListenerAdapter;
.source "TabLayout.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroid/support/design/widget/TabLayout$SlidingTabIndicator;->animateIndicatorToPosition(II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Landroid/support/design/widget/TabLayout$SlidingTabIndicator;

.field final synthetic val$position:I


# direct methods
.method constructor <init>(Landroid/support/design/widget/TabLayout$SlidingTabIndicator;I)V
    .locals 0
    .param p1, "this$1"    # Landroid/support/design/widget/TabLayout$SlidingTabIndicator;

    .line 2608
    iput-object p1, p0, Landroid/support/design/widget/TabLayout$SlidingTabIndicator$2;->this$1:Landroid/support/design/widget/TabLayout$SlidingTabIndicator;

    iput p2, p0, Landroid/support/design/widget/TabLayout$SlidingTabIndicator$2;->val$position:I

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 2
    .param p1, "animator"    # Landroid/animation/Animator;

    .line 2611
    iget-object v0, p0, Landroid/support/design/widget/TabLayout$SlidingTabIndicator$2;->this$1:Landroid/support/design/widget/TabLayout$SlidingTabIndicator;

    iget v1, p0, Landroid/support/design/widget/TabLayout$SlidingTabIndicator$2;->val$position:I

    iput v1, v0, Landroid/support/design/widget/TabLayout$SlidingTabIndicator;->selectedPosition:I

    .line 2612
    const/4 v1, 0x0

    iput v1, v0, Landroid/support/design/widget/TabLayout$SlidingTabIndicator;->selectionOffset:F

    .line 2613
    return-void
.end method
