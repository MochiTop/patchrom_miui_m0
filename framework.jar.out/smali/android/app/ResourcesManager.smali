.class public Landroid/app/ResourcesManager;
.super Ljava/lang/Object;
.source "ResourcesManager.java"


# static fields
.field static final DEBUG_CACHE:Z = false

.field static final DEBUG_STATS:Z = true

.field static final TAG:Ljava/lang/String; = "ResourcesManager"

.field static sPackageManager:Landroid/content/pm/IPackageManager;

.field private static sResourcesManager:Landroid/app/ResourcesManager;


# instance fields
.field final mActiveResources:Landroid/util/ArrayMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/ArrayMap",
            "<",
            "Landroid/content/res/ResourcesKey;",
            "Ljava/lang/ref/WeakReference",
            "<",
            "Landroid/content/res/Resources;",
            ">;>;"
        }
    .end annotation
.end field

.field final mDefaultDisplayMetrics:Landroid/util/ArrayMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/ArrayMap",
            "<",
            "Landroid/view/DisplayAdjustments;",
            "Landroid/util/DisplayMetrics;",
            ">;"
        }
    .end annotation
.end field

.field mResCompatibilityInfo:Landroid/content/res/CompatibilityInfo;

.field mResConfiguration:Landroid/content/res/Configuration;

.field final mTmpConfig:Landroid/content/res/Configuration;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 60
    new-instance v0, Landroid/util/ArrayMap;

    invoke-direct {v0}, Landroid/util/ArrayMap;-><init>()V

    iput-object v0, p0, Landroid/app/ResourcesManager;->mActiveResources:Landroid/util/ArrayMap;

    .line 63
    new-instance v0, Landroid/util/ArrayMap;

    invoke-direct {v0}, Landroid/util/ArrayMap;-><init>()V

    iput-object v0, p0, Landroid/app/ResourcesManager;->mDefaultDisplayMetrics:Landroid/util/ArrayMap;

    .line 70
    new-instance v0, Landroid/content/res/Configuration;

    invoke-direct {v0}, Landroid/content/res/Configuration;-><init>()V

    iput-object v0, p0, Landroid/app/ResourcesManager;->mTmpConfig:Landroid/content/res/Configuration;

    return-void
.end method

.method private attachIconAssets(Landroid/content/res/AssetManager;Landroid/content/res/CustomTheme;)Z
    .locals 13
    .parameter "assets"
    .parameter "theme"

    .prologue
    const/4 v8, 0x0

    .line 482
    const/4 v3, 0x0

    .line 484
    .local v3, piIcon:Landroid/content/pm/PackageInfo;
    :try_start_0
    invoke-static {}, Landroid/app/ResourcesManager;->getPackageManager()Landroid/content/pm/IPackageManager;

    move-result-object v9

    invoke-virtual {p2}, Landroid/content/res/CustomTheme;->getIconPackPkgName()Ljava/lang/String;

    move-result-object v10

    const/4 v11, 0x0

    invoke-static {}, Landroid/os/UserHandle;->myUserId()I

    move-result v12

    invoke-interface {v9, v10, v11, v12}, Landroid/content/pm/IPackageManager;->getPackageInfo(Ljava/lang/String;II)Landroid/content/pm/PackageInfo;
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    .line 488
    :goto_0
    if-eqz v3, :cond_0

    iget-object v9, v3, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    if-nez v9, :cond_1

    .line 506
    :cond_0
    :goto_1
    return v8

    .line 492
    :cond_1
    invoke-virtual {p2}, Landroid/content/res/CustomTheme;->getIconPackPkgName()Ljava/lang/String;

    move-result-object v2

    .line 493
    .local v2, iconPkg:Ljava/lang/String;
    if-eqz v2, :cond_2

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v8

    if-nez v8, :cond_2

    .line 494
    iget-object v8, v3, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget-object v7, v8, Landroid/content/pm/ApplicationInfo;->publicSourceDir:Ljava/lang/String;

    .line 495
    .local v7, themeIconPath:Ljava/lang/String;
    const-string v4, "assets/icons/"

    .line 496
    .local v4, prefixPath:Ljava/lang/String;
    invoke-static {v2}, Landroid/content/pm/ThemeUtils;->getIconPackDir(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 497
    .local v1, iconDir:Ljava/lang/String;
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "/resources.arsc"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 498
    .local v6, resTablePath:Ljava/lang/String;
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "/resources.apk"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 499
    .local v5, resApkPath:Ljava/lang/String;
    invoke-virtual {p1, v7, v6, v5, v4}, Landroid/content/res/AssetManager;->addIconPath(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 500
    .local v0, cookie:I
    if-eqz v0, :cond_2

    .line 501
    invoke-virtual {p1, v0}, Landroid/content/res/AssetManager;->setIconPackCookie(I)V

    .line 502
    invoke-virtual {p1, v2}, Landroid/content/res/AssetManager;->setIconPackageName(Ljava/lang/String;)V

    .line 506
    .end local v0           #cookie:I
    .end local v1           #iconDir:Ljava/lang/String;
    .end local v4           #prefixPath:Ljava/lang/String;
    .end local v5           #resApkPath:Ljava/lang/String;
    .end local v6           #resTablePath:Ljava/lang/String;
    .end local v7           #themeIconPath:Ljava/lang/String;
    :cond_2
    const/4 v8, 0x1

    goto :goto_1

    .line 485
    .end local v2           #iconPkg:Ljava/lang/String;
    :catch_0
    move-exception v9

    goto :goto_0
.end method

.method private attachThemeAssets(Landroid/content/res/AssetManager;Landroid/content/res/CustomTheme;)Z
    .locals 20
    .parameter "assets"
    .parameter "theme"

    .prologue
    .line 411
    const/4 v14, 0x0

    .line 412
    .local v14, piTheme:Landroid/content/pm/PackageInfo;
    const/4 v13, 0x0

    .line 413
    .local v13, piTarget:Landroid/content/pm/PackageInfo;
    const/4 v12, 0x0

    .line 419
    .local v12, piAndroid:Landroid/content/pm/PackageInfo;
    const/4 v11, 0x0

    .line 420
    .local v11, packageName:Ljava/lang/String;
    invoke-virtual/range {p1 .. p1}, Landroid/content/res/AssetManager;->getBasePackageCount()I

    move-result v10

    .line 421
    .local v10, count:I
    const/4 v3, 0x1

    if-le v10, v3, :cond_2

    .line 422
    const/4 v3, 0x1

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Landroid/content/res/AssetManager;->getBasePackageName(I)Ljava/lang/String;

    move-result-object v11

    .line 428
    :cond_0
    :try_start_0
    invoke-static {}, Landroid/app/ResourcesManager;->getPackageManager()Landroid/content/pm/IPackageManager;

    move-result-object v3

    move-object/from16 v0, p2

    invoke-virtual {v0, v11}, Landroid/content/res/CustomTheme;->getThemePackageNameForApp(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    const/16 v18, 0x0

    invoke-static {}, Landroid/os/UserHandle;->myUserId()I

    move-result v19

    move-object/from16 v0, v17

    move/from16 v1, v18

    move/from16 v2, v19

    invoke-interface {v3, v0, v1, v2}, Landroid/content/pm/IPackageManager;->getPackageInfo(Ljava/lang/String;II)Landroid/content/pm/PackageInfo;

    move-result-object v14

    .line 429
    invoke-static {}, Landroid/app/ResourcesManager;->getPackageManager()Landroid/content/pm/IPackageManager;

    move-result-object v3

    const/16 v17, 0x0

    invoke-static {}, Landroid/os/UserHandle;->myUserId()I

    move-result v18

    move/from16 v0, v17

    move/from16 v1, v18

    invoke-interface {v3, v11, v0, v1}, Landroid/content/pm/IPackageManager;->getPackageInfo(Ljava/lang/String;II)Landroid/content/pm/PackageInfo;

    move-result-object v13

    .line 430
    invoke-static {}, Landroid/app/ResourcesManager;->getPackageManager()Landroid/content/pm/IPackageManager;

    move-result-object v3

    const-string v17, "android"

    const/16 v18, 0x0

    invoke-static {}, Landroid/os/UserHandle;->myUserId()I

    move-result v19

    move-object/from16 v0, v17

    move/from16 v1, v18

    move/from16 v2, v19

    invoke-interface {v3, v0, v1, v2}, Landroid/content/pm/IPackageManager;->getPackageInfo(Ljava/lang/String;II)Landroid/content/pm/PackageInfo;
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v12

    .line 434
    :goto_0
    if-eqz v14, :cond_1

    iget-object v3, v14, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    if-eqz v3, :cond_1

    if-eqz v13, :cond_1

    iget-object v3, v13, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    if-eqz v3, :cond_1

    if-eqz v12, :cond_1

    iget-object v3, v12, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    if-nez v3, :cond_3

    .line 437
    :cond_1
    const/4 v3, 0x0

    .line 470
    :goto_1
    return v3

    .line 423
    :cond_2
    const/4 v3, 0x1

    if-gt v10, v3, :cond_0

    .line 424
    const/4 v3, 0x0

    goto :goto_1

    .line 440
    :cond_3
    iget-object v3, v14, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget-object v0, v3, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    move-object/from16 v16, v0

    .line 441
    .local v16, themePackageName:Ljava/lang/String;
    iget-object v3, v14, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget-object v4, v3, Landroid/content/pm/ApplicationInfo;->publicSourceDir:Ljava/lang/String;

    .line 443
    .local v4, themePath:Ljava/lang/String;
    iget-boolean v3, v13, Landroid/content/pm/PackageInfo;->isThemeApk:Z

    if-nez v3, :cond_4

    iget-object v3, v14, Landroid/content/pm/PackageInfo;->mOverlayTargets:Ljava/util/ArrayList;

    invoke-virtual {v3, v11}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 444
    iget-object v3, v13, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget-object v7, v3, Landroid/content/pm/ApplicationInfo;->sourceDir:Ljava/lang/String;

    .line 445
    .local v7, targetPackagePath:Ljava/lang/String;
    iget-boolean v3, v14, Landroid/content/pm/PackageInfo;->isLegacyThemeApk:Z

    if-eqz v3, :cond_6

    const-string v8, ""

    .line 446
    .local v8, prefixPath:Ljava/lang/String;
    :goto_2
    iget-object v3, v13, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    invoke-static {v3, v14}, Landroid/content/pm/ThemeUtils;->getResDir(Ljava/lang/String;Landroid/content/pm/PackageInfo;)Ljava/lang/String;

    move-result-object v15

    .line 447
    .local v15, resCachePath:Ljava/lang/String;
    iget-boolean v3, v14, Landroid/content/pm/PackageInfo;->isLegacyThemeApk:Z

    if-eqz v3, :cond_7

    const-string v5, ""

    .line 448
    .local v5, resTablePath:Ljava/lang/String;
    :goto_3
    iget-boolean v3, v14, Landroid/content/pm/PackageInfo;->isLegacyThemeApk:Z

    if-eqz v3, :cond_8

    const-string v6, ""

    .local v6, resApkPath:Ljava/lang/String;
    :goto_4
    move-object/from16 v3, p1

    .line 449
    invoke-virtual/range {v3 .. v8}, Landroid/content/res/AssetManager;->addOverlayPath(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v9

    .line 451
    .local v9, cookie:I
    if-eqz v9, :cond_4

    .line 452
    move-object/from16 v0, p1

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Landroid/content/res/AssetManager;->setThemePackageName(Ljava/lang/String;)V

    .line 453
    move-object/from16 v0, p1

    invoke-virtual {v0, v9}, Landroid/content/res/AssetManager;->addThemeCookie(I)V

    .line 457
    .end local v5           #resTablePath:Ljava/lang/String;
    .end local v6           #resApkPath:Ljava/lang/String;
    .end local v7           #targetPackagePath:Ljava/lang/String;
    .end local v8           #prefixPath:Ljava/lang/String;
    .end local v9           #cookie:I
    .end local v15           #resCachePath:Ljava/lang/String;
    :cond_4
    iget-boolean v3, v13, Landroid/content/pm/PackageInfo;->isThemeApk:Z

    if-nez v3, :cond_5

    iget-object v3, v14, Landroid/content/pm/PackageInfo;->mOverlayTargets:Ljava/util/ArrayList;

    const-string v17, "android"

    move-object/from16 v0, v17

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 458
    iget-object v3, v12, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    invoke-static {v3, v14}, Landroid/content/pm/ThemeUtils;->getResDir(Ljava/lang/String;Landroid/content/pm/PackageInfo;)Ljava/lang/String;

    move-result-object v15

    .line 459
    .restart local v15       #resCachePath:Ljava/lang/String;
    iget-boolean v3, v14, Landroid/content/pm/PackageInfo;->isLegacyThemeApk:Z

    if-eqz v3, :cond_9

    const-string v8, ""

    .line 460
    .restart local v8       #prefixPath:Ljava/lang/String;
    :goto_5
    iget-object v3, v12, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget-object v7, v3, Landroid/content/pm/ApplicationInfo;->publicSourceDir:Ljava/lang/String;

    .line 461
    .restart local v7       #targetPackagePath:Ljava/lang/String;
    iget-boolean v3, v14, Landroid/content/pm/PackageInfo;->isLegacyThemeApk:Z

    if-eqz v3, :cond_a

    const-string v5, ""

    .line 462
    .restart local v5       #resTablePath:Ljava/lang/String;
    :goto_6
    iget-boolean v3, v14, Landroid/content/pm/PackageInfo;->isLegacyThemeApk:Z

    if-eqz v3, :cond_b

    const-string v6, ""

    .restart local v6       #resApkPath:Ljava/lang/String;
    :goto_7
    move-object/from16 v3, p1

    .line 463
    invoke-virtual/range {v3 .. v8}, Landroid/content/res/AssetManager;->addOverlayPath(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v9

    .line 464
    .restart local v9       #cookie:I
    if-eqz v9, :cond_5

    .line 465
    move-object/from16 v0, p1

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Landroid/content/res/AssetManager;->setThemePackageName(Ljava/lang/String;)V

    .line 466
    move-object/from16 v0, p1

    invoke-virtual {v0, v9}, Landroid/content/res/AssetManager;->addThemeCookie(I)V

    .line 470
    .end local v5           #resTablePath:Ljava/lang/String;
    .end local v6           #resApkPath:Ljava/lang/String;
    .end local v7           #targetPackagePath:Ljava/lang/String;
    .end local v8           #prefixPath:Ljava/lang/String;
    .end local v9           #cookie:I
    .end local v15           #resCachePath:Ljava/lang/String;
    :cond_5
    const/4 v3, 0x1

    goto/16 :goto_1

    .line 445
    .restart local v7       #targetPackagePath:Ljava/lang/String;
    :cond_6
    iget-object v3, v13, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    invoke-static {v3}, Landroid/content/pm/ThemeUtils;->getOverlayPathToTarget(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    goto :goto_2

    .line 447
    .restart local v8       #prefixPath:Ljava/lang/String;
    .restart local v15       #resCachePath:Ljava/lang/String;
    :cond_7
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v17, "/resources.arsc"

    move-object/from16 v0, v17

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    goto :goto_3

    .line 448
    .restart local v5       #resTablePath:Ljava/lang/String;
    :cond_8
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v17, "/resources.apk"

    move-object/from16 v0, v17

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    goto/16 :goto_4

    .line 459
    .end local v5           #resTablePath:Ljava/lang/String;
    .end local v7           #targetPackagePath:Ljava/lang/String;
    .end local v8           #prefixPath:Ljava/lang/String;
    :cond_9
    iget-object v3, v12, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    invoke-static {v3}, Landroid/content/pm/ThemeUtils;->getOverlayPathToTarget(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    goto :goto_5

    .line 461
    .restart local v7       #targetPackagePath:Ljava/lang/String;
    .restart local v8       #prefixPath:Ljava/lang/String;
    :cond_a
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v17, "/resources.arsc"

    move-object/from16 v0, v17

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    goto :goto_6

    .line 462
    .restart local v5       #resTablePath:Ljava/lang/String;
    :cond_b
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v17, "/resources.apk"

    move-object/from16 v0, v17

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    goto :goto_7

    .line 431
    .end local v4           #themePath:Ljava/lang/String;
    .end local v5           #resTablePath:Ljava/lang/String;
    .end local v7           #targetPackagePath:Ljava/lang/String;
    .end local v8           #prefixPath:Ljava/lang/String;
    .end local v15           #resCachePath:Ljava/lang/String;
    .end local v16           #themePackageName:Ljava/lang/String;
    :catch_0
    move-exception v3

    goto/16 :goto_0
.end method

.method private detachThemeAssets(Landroid/content/res/AssetManager;)V
    .locals 6
    .parameter "assets"

    .prologue
    const/4 v5, 0x0

    .line 510
    invoke-virtual {p1}, Landroid/content/res/AssetManager;->getThemePackageName()Ljava/lang/String;

    move-result-object v3

    .line 511
    .local v3, themePackageName:Ljava/lang/String;
    invoke-virtual {p1}, Landroid/content/res/AssetManager;->getIconPackageName()Ljava/lang/String;

    move-result-object v1

    .line 514
    .local v1, iconPackageName:Ljava/lang/String;
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_0

    invoke-virtual {p1}, Landroid/content/res/AssetManager;->getIconPackCookie()I

    move-result v4

    if-lez v4, :cond_0

    .line 515
    invoke-virtual {p1}, Landroid/content/res/AssetManager;->getIconPackCookie()I

    move-result v4

    invoke-virtual {p1, v1, v4}, Landroid/content/res/AssetManager;->removeOverlayPath(Ljava/lang/String;I)Z

    .line 516
    invoke-virtual {p1, v5}, Landroid/content/res/AssetManager;->setIconPackageName(Ljava/lang/String;)V

    .line 517
    const/4 v4, 0x0

    invoke-virtual {p1, v4}, Landroid/content/res/AssetManager;->setIconPackCookie(I)V

    .line 519
    :cond_0
    invoke-virtual {p1}, Landroid/content/res/AssetManager;->getThemeCookies()Ljava/util/ArrayList;

    move-result-object v2

    .line 520
    .local v2, themeCookies:Ljava/util/List;,"Ljava/util/List<Ljava/lang/Integer;>;"
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_1

    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_1

    .line 522
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v4

    add-int/lit8 v0, v4, -0x1

    .local v0, i:I
    :goto_0
    if-ltz v0, :cond_1

    .line 523
    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    invoke-virtual {p1, v3, v4}, Landroid/content/res/AssetManager;->removeOverlayPath(Ljava/lang/String;I)Z

    .line 522
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    .line 526
    .end local v0           #i:I
    :cond_1
    invoke-virtual {p1}, Landroid/content/res/AssetManager;->getThemeCookies()Ljava/util/ArrayList;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/ArrayList;->clear()V

    .line 527
    invoke-virtual {p1, v5}, Landroid/content/res/AssetManager;->setThemePackageName(Ljava/lang/String;)V

    .line 528
    return-void
.end method

.method public static getInstance()Landroid/app/ResourcesManager;
    .locals 2

    .prologue
    .line 73
    const-class v1, Landroid/app/ResourcesManager;

    monitor-enter v1

    .line 74
    :try_start_0
    sget-object v0, Landroid/app/ResourcesManager;->sResourcesManager:Landroid/app/ResourcesManager;

    if-nez v0, :cond_0

    .line 75
    new-instance v0, Landroid/app/ResourcesManager;

    invoke-direct {v0}, Landroid/app/ResourcesManager;-><init>()V

    sput-object v0, Landroid/app/ResourcesManager;->sResourcesManager:Landroid/app/ResourcesManager;

    .line 77
    :cond_0
    sget-object v0, Landroid/app/ResourcesManager;->sResourcesManager:Landroid/app/ResourcesManager;

    monitor-exit v1

    return-object v0

    .line 78
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public static getPackageManager()Landroid/content/pm/IPackageManager;
    .locals 2

    .prologue
    .line 390
    sget-object v1, Landroid/app/ResourcesManager;->sPackageManager:Landroid/content/pm/IPackageManager;

    if-eqz v1, :cond_0

    .line 391
    sget-object v1, Landroid/app/ResourcesManager;->sPackageManager:Landroid/content/pm/IPackageManager;

    .line 395
    .local v0, b:Landroid/os/IBinder;
    :goto_0
    return-object v1

    .line 393
    .end local v0           #b:Landroid/os/IBinder;
    :cond_0
    const-string/jumbo v1, "package"

    invoke-static {v1}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v0

    .line 394
    .restart local v0       #b:Landroid/os/IBinder;
    invoke-static {v0}, Landroid/content/pm/IPackageManager$Stub;->asInterface(Landroid/os/IBinder;)Landroid/content/pm/IPackageManager;

    move-result-object v1

    sput-object v1, Landroid/app/ResourcesManager;->sPackageManager:Landroid/content/pm/IPackageManager;

    .line 395
    sget-object v1, Landroid/app/ResourcesManager;->sPackageManager:Landroid/content/pm/IPackageManager;

    goto :goto_0
.end method

.method private setActivityIcons(Landroid/content/res/Resources;)V
    .locals 12
    .parameter "r"

    .prologue
    .line 271
    new-instance v5, Landroid/util/SparseArray;

    invoke-direct {v5}, Landroid/util/SparseArray;-><init>()V

    .line 272
    .local v5, iconResources:Landroid/util/SparseArray;,"Landroid/util/SparseArray<Landroid/content/pm/PackageItemInfo;>;"
    invoke-virtual {p1}, Landroid/content/res/Resources;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v9

    invoke-virtual {v9}, Landroid/content/res/AssetManager;->getAppName()Ljava/lang/String;

    move-result-object v8

    .line 273
    .local v8, pkgName:Ljava/lang/String;
    const/4 v7, 0x0

    .line 274
    .local v7, pkgInfo:Landroid/content/pm/PackageInfo;
    const/4 v1, 0x0

    .line 277
    .local v1, appInfo:Landroid/content/pm/ApplicationInfo;
    :try_start_0
    invoke-static {}, Landroid/app/ResourcesManager;->getPackageManager()Landroid/content/pm/IPackageManager;

    move-result-object v9

    const/4 v10, 0x1

    invoke-static {}, Landroid/os/UserHandle;->myUserId()I

    move-result v11

    invoke-interface {v9, v8, v10, v11}, Landroid/content/pm/IPackageManager;->getPackageInfo(Ljava/lang/String;II)Landroid/content/pm/PackageInfo;
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v7

    .line 284
    if-eqz v7, :cond_0

    iget-object v9, v7, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    if-eqz v9, :cond_0

    .line 285
    iget-object v1, v7, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    .line 286
    iget v9, v1, Landroid/content/pm/ApplicationInfo;->themedIcon:I

    if-eqz v9, :cond_0

    iget v9, v1, Landroid/content/pm/ApplicationInfo;->icon:I

    invoke-virtual {v5, v9, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 290
    :cond_0
    if-eqz v7, :cond_3

    iget-object v9, v7, Landroid/content/pm/PackageInfo;->activities:[Landroid/content/pm/ActivityInfo;

    if-eqz v9, :cond_3

    .line 291
    iget-object v2, v7, Landroid/content/pm/PackageInfo;->activities:[Landroid/content/pm/ActivityInfo;

    .local v2, arr$:[Landroid/content/pm/ActivityInfo;
    array-length v6, v2

    .local v6, len$:I
    const/4 v4, 0x0

    .local v4, i$:I
    :goto_0
    if-ge v4, v6, :cond_3

    aget-object v0, v2, v4

    .line 292
    .local v0, ai:Landroid/content/pm/ActivityInfo;
    iget v9, v0, Landroid/content/pm/ActivityInfo;->themedIcon:I

    if-eqz v9, :cond_2

    iget v9, v0, Landroid/content/pm/ActivityInfo;->icon:I

    if-eqz v9, :cond_2

    .line 293
    iget v9, v0, Landroid/content/pm/ActivityInfo;->icon:I

    invoke-virtual {v5, v9, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 291
    :cond_1
    :goto_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 278
    .end local v0           #ai:Landroid/content/pm/ActivityInfo;
    .end local v2           #arr$:[Landroid/content/pm/ActivityInfo;
    .end local v4           #i$:I
    .end local v6           #len$:I
    :catch_0
    move-exception v3

    .line 279
    .local v3, e1:Landroid/os/RemoteException;
    const-string v9, "ResourcesManager"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Unable to get pkg "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 300
    .end local v3           #e1:Landroid/os/RemoteException;
    :goto_2
    return-void

    .line 294
    .restart local v0       #ai:Landroid/content/pm/ActivityInfo;
    .restart local v2       #arr$:[Landroid/content/pm/ActivityInfo;
    .restart local v4       #i$:I
    .restart local v6       #len$:I
    :cond_2
    iget v9, v0, Landroid/content/pm/ActivityInfo;->themedIcon:I

    if-eqz v9, :cond_1

    if-eqz v1, :cond_1

    iget v9, v1, Landroid/content/pm/ApplicationInfo;->icon:I

    if-eqz v9, :cond_1

    .line 295
    iget v9, v1, Landroid/content/pm/ApplicationInfo;->icon:I

    invoke-virtual {v5, v9, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    goto :goto_1

    .line 299
    .end local v0           #ai:Landroid/content/pm/ActivityInfo;
    .end local v2           #arr$:[Landroid/content/pm/ActivityInfo;
    .end local v4           #i$:I
    .end local v6           #len$:I
    :cond_3
    invoke-virtual {p1, v5}, Landroid/content/res/Resources;->setIconResources(Landroid/util/SparseArray;)V

    goto :goto_2
.end method


# virtual methods
.method public applyCompatConfiguration(ILandroid/content/res/Configuration;)Z
    .locals 1
    .parameter "displayDensity"
    .parameter "compatConfiguration"

    .prologue
    .line 152
    iget-object v0, p0, Landroid/app/ResourcesManager;->mResCompatibilityInfo:Landroid/content/res/CompatibilityInfo;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/app/ResourcesManager;->mResCompatibilityInfo:Landroid/content/res/CompatibilityInfo;

    invoke-virtual {v0}, Landroid/content/res/CompatibilityInfo;->supportsScreen()Z

    move-result v0

    if-nez v0, :cond_0

    .line 153
    iget-object v0, p0, Landroid/app/ResourcesManager;->mResCompatibilityInfo:Landroid/content/res/CompatibilityInfo;

    invoke-virtual {v0, p1, p2}, Landroid/content/res/CompatibilityInfo;->applyToConfiguration(ILandroid/content/res/Configuration;)V

    .line 154
    const/4 v0, 0x1

    .line 156
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public final applyConfigurationToResourcesLocked(Landroid/content/res/Configuration;Landroid/content/res/CompatibilityInfo;)I
    .locals 13
    .parameter "config"
    .parameter "compat"

    .prologue
    .line 304
    iget-object v12, p0, Landroid/app/ResourcesManager;->mResConfiguration:Landroid/content/res/Configuration;

    if-nez v12, :cond_0

    .line 305
    new-instance v12, Landroid/content/res/Configuration;

    invoke-direct {v12}, Landroid/content/res/Configuration;-><init>()V

    iput-object v12, p0, Landroid/app/ResourcesManager;->mResConfiguration:Landroid/content/res/Configuration;

    .line 307
    :cond_0
    iget-object v12, p0, Landroid/app/ResourcesManager;->mResConfiguration:Landroid/content/res/Configuration;

    invoke-virtual {v12, p1}, Landroid/content/res/Configuration;->isOtherSeqNewer(Landroid/content/res/Configuration;)Z

    move-result v12

    if-nez v12, :cond_2

    if-nez p2, :cond_2

    .line 310
    const/4 v1, 0x0

    .line 386
    :cond_1
    return v1

    .line 312
    :cond_2
    iget-object v12, p0, Landroid/app/ResourcesManager;->mResConfiguration:Landroid/content/res/Configuration;

    invoke-virtual {v12, p1}, Landroid/content/res/Configuration;->updateFrom(Landroid/content/res/Configuration;)I

    move-result v1

    .line 313
    .local v1, changes:I
    invoke-virtual {p0}, Landroid/app/ResourcesManager;->flushDisplayMetricsLocked()V

    .line 314
    const/4 v12, 0x0

    invoke-virtual {p0, v12}, Landroid/app/ResourcesManager;->getDisplayMetricsLocked(I)Landroid/util/DisplayMetrics;

    move-result-object v2

    .line 316
    .local v2, defaultDisplayMetrics:Landroid/util/DisplayMetrics;
    if-eqz p2, :cond_4

    iget-object v12, p0, Landroid/app/ResourcesManager;->mResCompatibilityInfo:Landroid/content/res/CompatibilityInfo;

    if-eqz v12, :cond_3

    iget-object v12, p0, Landroid/app/ResourcesManager;->mResCompatibilityInfo:Landroid/content/res/CompatibilityInfo;

    invoke-virtual {v12, p2}, Landroid/content/res/CompatibilityInfo;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-nez v12, :cond_4

    .line 318
    :cond_3
    iput-object p2, p0, Landroid/app/ResourcesManager;->mResCompatibilityInfo:Landroid/content/res/CompatibilityInfo;

    .line 319
    or-int/lit16 v1, v1, 0xd00

    .line 325
    :cond_4
    iget-object v12, p1, Landroid/content/res/Configuration;->locale:Ljava/util/Locale;

    if-eqz v12, :cond_5

    .line 326
    iget-object v12, p1, Landroid/content/res/Configuration;->locale:Ljava/util/Locale;

    invoke-static {v12}, Ljava/util/Locale;->setDefault(Ljava/util/Locale;)V

    .line 329
    :cond_5
    invoke-static {p1, v2, p2}, Landroid/content/res/Resources;->updateSystemConfiguration(Landroid/content/res/Configuration;Landroid/util/DisplayMetrics;Landroid/content/res/CompatibilityInfo;)V

    .line 331
    invoke-static {}, Landroid/app/ApplicationPackageManager;->configurationChanged()V

    .line 334
    const/4 v11, 0x0

    .line 336
    .local v11, tmpConfig:Landroid/content/res/Configuration;
    iget-object v12, p0, Landroid/app/ResourcesManager;->mActiveResources:Landroid/util/ArrayMap;

    invoke-virtual {v12}, Landroid/util/ArrayMap;->size()I

    move-result v12

    add-int/lit8 v6, v12, -0x1

    .local v6, i:I
    :goto_0
    if-ltz v6, :cond_1

    .line 337
    iget-object v12, p0, Landroid/app/ResourcesManager;->mActiveResources:Landroid/util/ArrayMap;

    invoke-virtual {v12, v6}, Landroid/util/ArrayMap;->keyAt(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/content/res/ResourcesKey;

    .line 338
    .local v8, key:Landroid/content/res/ResourcesKey;
    iget-object v12, p0, Landroid/app/ResourcesManager;->mActiveResources:Landroid/util/ArrayMap;

    invoke-virtual {v12, v6}, Landroid/util/ArrayMap;->valueAt(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/lang/ref/WeakReference;

    invoke-virtual {v12}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Landroid/content/res/Resources;

    .line 339
    .local v9, r:Landroid/content/res/Resources;
    if-eqz v9, :cond_f

    .line 342
    iget v3, v8, Landroid/content/res/ResourcesKey;->mDisplayId:I

    .line 343
    .local v3, displayId:I
    if-nez v3, :cond_c

    const/4 v7, 0x1

    .line 344
    .local v7, isDefaultDisplay:Z
    :goto_1
    move-object v4, v2

    .line 345
    .local v4, dm:Landroid/util/DisplayMetrics;
    invoke-virtual {v8}, Landroid/content/res/ResourcesKey;->hasOverrideConfiguration()Z

    move-result v5

    .line 346
    .local v5, hasOverrideConfiguration:Z
    const v12, 0x8000

    and-int/2addr v12, v1

    if-eqz v12, :cond_d

    const/4 v10, 0x1

    .line 347
    .local v10, themeChanged:Z
    :goto_2
    if-eqz v10, :cond_6

    .line 348
    invoke-virtual {v9}, Landroid/content/res/Resources;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v0

    .line 349
    .local v0, am:Landroid/content/res/AssetManager;
    invoke-virtual {v0}, Landroid/content/res/AssetManager;->hasThemeSupport()Z

    move-result v12

    if-eqz v12, :cond_6

    .line 350
    const/4 v12, 0x0

    invoke-virtual {v9, v12}, Landroid/content/res/Resources;->setIconResources(Landroid/util/SparseArray;)V

    .line 351
    invoke-direct {p0, v0}, Landroid/app/ResourcesManager;->detachThemeAssets(Landroid/content/res/AssetManager;)V

    .line 352
    iget-object v12, p1, Landroid/content/res/Configuration;->customTheme:Landroid/content/res/CustomTheme;

    if-eqz v12, :cond_6

    .line 353
    iget-object v12, p1, Landroid/content/res/Configuration;->customTheme:Landroid/content/res/CustomTheme;

    invoke-direct {p0, v0, v12}, Landroid/app/ResourcesManager;->attachThemeAssets(Landroid/content/res/AssetManager;Landroid/content/res/CustomTheme;)Z

    .line 354
    iget-object v12, p1, Landroid/content/res/Configuration;->customTheme:Landroid/content/res/CustomTheme;

    invoke-direct {p0, v0, v12}, Landroid/app/ResourcesManager;->attachIconAssets(Landroid/content/res/AssetManager;Landroid/content/res/CustomTheme;)Z

    .line 355
    invoke-direct {p0, v9}, Landroid/app/ResourcesManager;->setActivityIcons(Landroid/content/res/Resources;)V

    .line 359
    .end local v0           #am:Landroid/content/res/AssetManager;
    :cond_6
    if-eqz v7, :cond_7

    if-eqz v5, :cond_e

    .line 360
    :cond_7
    if-nez v11, :cond_8

    .line 361
    new-instance v11, Landroid/content/res/Configuration;

    .end local v11           #tmpConfig:Landroid/content/res/Configuration;
    invoke-direct {v11}, Landroid/content/res/Configuration;-><init>()V

    .line 363
    .restart local v11       #tmpConfig:Landroid/content/res/Configuration;
    :cond_8
    invoke-virtual {v11, p1}, Landroid/content/res/Configuration;->setTo(Landroid/content/res/Configuration;)V

    .line 364
    if-nez v7, :cond_9

    .line 365
    invoke-virtual {p0, v3}, Landroid/app/ResourcesManager;->getDisplayMetricsLocked(I)Landroid/util/DisplayMetrics;

    move-result-object v4

    .line 366
    invoke-virtual {p0, v4, v11}, Landroid/app/ResourcesManager;->applyNonDefaultDisplayMetricsToConfigurationLocked(Landroid/util/DisplayMetrics;Landroid/content/res/Configuration;)V

    .line 368
    :cond_9
    if-eqz v5, :cond_a

    .line 369
    iget-object v12, v8, Landroid/content/res/ResourcesKey;->mOverrideConfiguration:Landroid/content/res/Configuration;

    invoke-virtual {v11, v12}, Landroid/content/res/Configuration;->updateFrom(Landroid/content/res/Configuration;)I

    .line 371
    :cond_a
    invoke-virtual {v9, v11, v4, p2}, Landroid/content/res/Resources;->updateConfiguration(Landroid/content/res/Configuration;Landroid/util/DisplayMetrics;Landroid/content/res/CompatibilityInfo;)V

    .line 375
    :goto_3
    if-eqz v10, :cond_b

    .line 376
    invoke-virtual {v9}, Landroid/content/res/Resources;->updateStringCache()V

    .line 336
    .end local v3           #displayId:I
    .end local v4           #dm:Landroid/util/DisplayMetrics;
    .end local v5           #hasOverrideConfiguration:Z
    .end local v7           #isDefaultDisplay:Z
    .end local v10           #themeChanged:Z
    :cond_b
    :goto_4
    add-int/lit8 v6, v6, -0x1

    goto :goto_0

    .line 343
    .restart local v3       #displayId:I
    :cond_c
    const/4 v7, 0x0

    goto :goto_1

    .line 346
    .restart local v4       #dm:Landroid/util/DisplayMetrics;
    .restart local v5       #hasOverrideConfiguration:Z
    .restart local v7       #isDefaultDisplay:Z
    :cond_d
    const/4 v10, 0x0

    goto :goto_2

    .line 373
    .restart local v10       #themeChanged:Z
    :cond_e
    invoke-virtual {v9, p1, v4, p2}, Landroid/content/res/Resources;->updateConfiguration(Landroid/content/res/Configuration;Landroid/util/DisplayMetrics;Landroid/content/res/CompatibilityInfo;)V

    goto :goto_3

    .line 382
    .end local v3           #displayId:I
    .end local v4           #dm:Landroid/util/DisplayMetrics;
    .end local v5           #hasOverrideConfiguration:Z
    .end local v7           #isDefaultDisplay:Z
    .end local v10           #themeChanged:Z
    :cond_f
    iget-object v12, p0, Landroid/app/ResourcesManager;->mActiveResources:Landroid/util/ArrayMap;

    invoke-virtual {v12, v6}, Landroid/util/ArrayMap;->removeAt(I)Ljava/lang/Object;

    goto :goto_4
.end method

.method final applyNonDefaultDisplayMetricsToConfigurationLocked(Landroid/util/DisplayMetrics;Landroid/content/res/Configuration;)V
    .locals 4
    .parameter "dm"
    .parameter "config"

    .prologue
    const/4 v3, 0x1

    .line 130
    iput v3, p2, Landroid/content/res/Configuration;->touchscreen:I

    .line 131
    iget v1, p1, Landroid/util/DisplayMetrics;->densityDpi:I

    iput v1, p2, Landroid/content/res/Configuration;->densityDpi:I

    .line 132
    iget v1, p1, Landroid/util/DisplayMetrics;->widthPixels:I

    int-to-float v1, v1

    iget v2, p1, Landroid/util/DisplayMetrics;->density:F

    div-float/2addr v1, v2

    float-to-int v1, v1

    iput v1, p2, Landroid/content/res/Configuration;->screenWidthDp:I

    .line 133
    iget v1, p1, Landroid/util/DisplayMetrics;->heightPixels:I

    int-to-float v1, v1

    iget v2, p1, Landroid/util/DisplayMetrics;->density:F

    div-float/2addr v1, v2

    float-to-int v1, v1

    iput v1, p2, Landroid/content/res/Configuration;->screenHeightDp:I

    .line 134
    iget v1, p2, Landroid/content/res/Configuration;->screenLayout:I

    invoke-static {v1}, Landroid/content/res/Configuration;->resetScreenLayout(I)I

    move-result v0

    .line 135
    .local v0, sl:I
    iget v1, p1, Landroid/util/DisplayMetrics;->widthPixels:I

    iget v2, p1, Landroid/util/DisplayMetrics;->heightPixels:I

    if-le v1, v2, :cond_0

    .line 136
    const/4 v1, 0x2

    iput v1, p2, Landroid/content/res/Configuration;->orientation:I

    .line 137
    iget v1, p2, Landroid/content/res/Configuration;->screenWidthDp:I

    iget v2, p2, Landroid/content/res/Configuration;->screenHeightDp:I

    invoke-static {v0, v1, v2}, Landroid/content/res/Configuration;->reduceScreenLayout(III)I

    move-result v1

    iput v1, p2, Landroid/content/res/Configuration;->screenLayout:I

    .line 144
    :goto_0
    iget v1, p2, Landroid/content/res/Configuration;->screenWidthDp:I

    iput v1, p2, Landroid/content/res/Configuration;->smallestScreenWidthDp:I

    .line 145
    iget v1, p2, Landroid/content/res/Configuration;->screenWidthDp:I

    iput v1, p2, Landroid/content/res/Configuration;->compatScreenWidthDp:I

    .line 146
    iget v1, p2, Landroid/content/res/Configuration;->screenHeightDp:I

    iput v1, p2, Landroid/content/res/Configuration;->compatScreenHeightDp:I

    .line 147
    iget v1, p2, Landroid/content/res/Configuration;->smallestScreenWidthDp:I

    iput v1, p2, Landroid/content/res/Configuration;->compatSmallestScreenWidthDp:I

    .line 148
    return-void

    .line 140
    :cond_0
    iput v3, p2, Landroid/content/res/Configuration;->orientation:I

    .line 141
    iget v1, p2, Landroid/content/res/Configuration;->screenHeightDp:I

    iget v2, p2, Landroid/content/res/Configuration;->screenWidthDp:I

    invoke-static {v0, v1, v2}, Landroid/content/res/Configuration;->reduceScreenLayout(III)I

    move-result v1

    iput v1, p2, Landroid/content/res/Configuration;->screenLayout:I

    goto :goto_0
.end method

.method public flushDisplayMetricsLocked()V
    .locals 1

    .prologue
    .line 86
    iget-object v0, p0, Landroid/app/ResourcesManager;->mDefaultDisplayMetrics:Landroid/util/ArrayMap;

    invoke-virtual {v0}, Landroid/util/ArrayMap;->clear()V

    .line 87
    return-void
.end method

.method public getConfiguration()Landroid/content/res/Configuration;
    .locals 1

    .prologue
    .line 82
    iget-object v0, p0, Landroid/app/ResourcesManager;->mResConfiguration:Landroid/content/res/Configuration;

    return-object v0
.end method

.method public getDisplayMetricsLocked(I)Landroid/util/DisplayMetrics;
    .locals 1
    .parameter "displayId"

    .prologue
    .line 90
    sget-object v0, Landroid/view/DisplayAdjustments;->DEFAULT_DISPLAY_ADJUSTMENTS:Landroid/view/DisplayAdjustments;

    invoke-virtual {p0, p1, v0}, Landroid/app/ResourcesManager;->getDisplayMetricsLocked(ILandroid/view/DisplayAdjustments;)Landroid/util/DisplayMetrics;

    move-result-object v0

    return-object v0
.end method

.method public getDisplayMetricsLocked(ILandroid/view/DisplayAdjustments;)Landroid/util/DisplayMetrics;
    .locals 6
    .parameter "displayId"
    .parameter "daj"

    .prologue
    .line 94
    if-nez p1, :cond_0

    const/4 v4, 0x1

    .line 95
    .local v4, isDefaultDisplay:Z
    :goto_0
    if-eqz v4, :cond_1

    iget-object v5, p0, Landroid/app/ResourcesManager;->mDefaultDisplayMetrics:Landroid/util/ArrayMap;

    invoke-virtual {v5, p2}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/util/DisplayMetrics;

    move-object v2, v5

    .line 96
    .local v2, dm:Landroid/util/DisplayMetrics;
    :goto_1
    if-eqz v2, :cond_2

    move-object v3, v2

    .line 125
    .end local v2           #dm:Landroid/util/DisplayMetrics;
    .local v3, dm:Ljava/lang/Object;
    :goto_2
    return-object v3

    .line 94
    .end local v3           #dm:Ljava/lang/Object;
    .end local v4           #isDefaultDisplay:Z
    :cond_0
    const/4 v4, 0x0

    goto :goto_0

    .line 95
    .restart local v4       #isDefaultDisplay:Z
    :cond_1
    const/4 v2, 0x0

    goto :goto_1

    .line 99
    .restart local v2       #dm:Landroid/util/DisplayMetrics;
    :cond_2
    new-instance v2, Landroid/util/DisplayMetrics;

    .end local v2           #dm:Landroid/util/DisplayMetrics;
    invoke-direct {v2}, Landroid/util/DisplayMetrics;-><init>()V

    .line 101
    .restart local v2       #dm:Landroid/util/DisplayMetrics;
    invoke-static {}, Landroid/hardware/display/DisplayManagerGlobal;->getInstance()Landroid/hardware/display/DisplayManagerGlobal;

    move-result-object v1

    .line 102
    .local v1, displayManager:Landroid/hardware/display/DisplayManagerGlobal;
    if-nez v1, :cond_3

    .line 104
    invoke-virtual {v2}, Landroid/util/DisplayMetrics;->setToDefaults()V

    move-object v3, v2

    .line 105
    .restart local v3       #dm:Ljava/lang/Object;
    goto :goto_2

    .line 108
    .end local v3           #dm:Ljava/lang/Object;
    :cond_3
    if-eqz v4, :cond_4

    .line 109
    iget-object v5, p0, Landroid/app/ResourcesManager;->mDefaultDisplayMetrics:Landroid/util/ArrayMap;

    invoke-virtual {v5, p2, v2}, Landroid/util/ArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 112
    :cond_4
    invoke-virtual {v1, p1, p2}, Landroid/hardware/display/DisplayManagerGlobal;->getCompatibleDisplay(ILandroid/view/DisplayAdjustments;)Landroid/view/Display;

    move-result-object v0

    .line 113
    .local v0, d:Landroid/view/Display;
    if-eqz v0, :cond_5

    .line 114
    invoke-virtual {v0, v2}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    :goto_3
    move-object v3, v2

    .line 125
    .restart local v3       #dm:Ljava/lang/Object;
    goto :goto_2

    .line 120
    .end local v3           #dm:Ljava/lang/Object;
    :cond_5
    invoke-virtual {v2}, Landroid/util/DisplayMetrics;->setToDefaults()V

    goto :goto_3
.end method

.method public getTopLevelResources(Ljava/lang/String;[Ljava/lang/String;ILjava/lang/String;Landroid/content/res/Configuration;Landroid/content/res/CompatibilityInfo;Landroid/os/IBinder;Landroid/content/Context;)Landroid/content/res/Resources;
    .locals 19
    .parameter "resDir"
    .parameter "overlayDirs"
    .parameter "displayId"
    .parameter "packageName"
    .parameter "overrideConfiguration"
    .parameter "compatInfo"
    .parameter "token"
    .parameter "context"

    .prologue
    .line 168
    move-object/from16 v0, p6

    iget v6, v0, Landroid/content/res/CompatibilityInfo;->applicationScale:F

    .line 169
    .local v6, scale:F
    move-object/from16 v0, p6

    iget-boolean v7, v0, Landroid/content/res/CompatibilityInfo;->isThemeable:Z

    .line 170
    .local v7, isThemeable:Z
    new-instance v2, Landroid/content/res/ResourcesKey;

    move-object/from16 v3, p1

    move/from16 v4, p3

    move-object/from16 v5, p5

    move-object/from16 v8, p7

    invoke-direct/range {v2 .. v8}, Landroid/content/res/ResourcesKey;-><init>(Ljava/lang/String;ILandroid/content/res/Configuration;FZLandroid/os/IBinder;)V

    .line 173
    .local v2, key:Landroid/content/res/ResourcesKey;
    monitor-enter p0

    .line 178
    :try_start_0
    move-object/from16 v0, p0

    iget-object v3, v0, Landroid/app/ResourcesManager;->mActiveResources:Landroid/util/ArrayMap;

    invoke-virtual {v3, v2}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Ljava/lang/ref/WeakReference;

    .line 179
    .local v18, wr:Ljava/lang/ref/WeakReference;,"Ljava/lang/ref/WeakReference<Landroid/content/res/Resources;>;"
    if-eqz v18, :cond_0

    invoke-virtual/range {v18 .. v18}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/content/res/Resources;

    move-object v8, v3

    .line 181
    .local v8, r:Landroid/content/res/Resources;
    :goto_0
    if-eqz v8, :cond_1

    invoke-virtual {v8}, Landroid/content/res/Resources;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/res/AssetManager;->isUpToDate()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 186
    monitor-exit p0

    move-object v15, v8

    .line 257
    :goto_1
    return-object v15

    .line 179
    .end local v8           #r:Landroid/content/res/Resources;
    :cond_0
    const/4 v8, 0x0

    goto :goto_0

    .line 188
    .restart local v8       #r:Landroid/content/res/Resources;
    :cond_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 195
    new-instance v9, Landroid/content/res/AssetManager;

    invoke-direct {v9}, Landroid/content/res/AssetManager;-><init>()V

    .line 196
    .local v9, assets:Landroid/content/res/AssetManager;
    move-object/from16 v0, p4

    invoke-virtual {v9, v0}, Landroid/content/res/AssetManager;->setAppName(Ljava/lang/String;)V

    .line 197
    move-object/from16 v0, p6

    iget-boolean v3, v0, Landroid/content/res/CompatibilityInfo;->isThemeable:Z

    invoke-virtual {v9, v3}, Landroid/content/res/AssetManager;->setThemeSupport(Z)V

    .line 198
    move-object/from16 v0, p1

    invoke-virtual {v9, v0}, Landroid/content/res/AssetManager;->addAssetPath(Ljava/lang/String;)I

    move-result v3

    if-nez v3, :cond_2

    .line 199
    const/4 v15, 0x0

    goto :goto_1

    .line 188
    .end local v8           #r:Landroid/content/res/Resources;
    .end local v9           #assets:Landroid/content/res/AssetManager;
    .end local v18           #wr:Ljava/lang/ref/WeakReference;,"Ljava/lang/ref/WeakReference<Landroid/content/res/Resources;>;"
    :catchall_0
    move-exception v3

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v3

    .line 203
    .restart local v8       #r:Landroid/content/res/Resources;
    .restart local v9       #assets:Landroid/content/res/AssetManager;
    .restart local v18       #wr:Ljava/lang/ref/WeakReference;,"Ljava/lang/ref/WeakReference<Landroid/content/res/Resources;>;"
    :cond_2
    move-object/from16 v0, p0

    move/from16 v1, p3

    invoke-virtual {v0, v1}, Landroid/app/ResourcesManager;->getDisplayMetricsLocked(I)Landroid/util/DisplayMetrics;

    move-result-object v10

    .line 205
    .local v10, dm:Landroid/util/DisplayMetrics;
    if-nez p3, :cond_8

    const/16 v17, 0x1

    .line 206
    .local v17, isDefaultDisplay:Z
    :goto_2
    invoke-virtual {v2}, Landroid/content/res/ResourcesKey;->hasOverrideConfiguration()Z

    move-result v16

    .line 207
    .local v16, hasOverrideConfig:Z
    if-eqz v17, :cond_3

    if-eqz v16, :cond_9

    .line 208
    :cond_3
    new-instance v11, Landroid/content/res/Configuration;

    invoke-virtual/range {p0 .. p0}, Landroid/app/ResourcesManager;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v3

    invoke-direct {v11, v3}, Landroid/content/res/Configuration;-><init>(Landroid/content/res/Configuration;)V

    .line 209
    .local v11, config:Landroid/content/res/Configuration;
    if-nez v17, :cond_4

    .line 210
    move-object/from16 v0, p0

    invoke-virtual {v0, v10, v11}, Landroid/app/ResourcesManager;->applyNonDefaultDisplayMetricsToConfigurationLocked(Landroid/util/DisplayMetrics;Landroid/content/res/Configuration;)V

    .line 212
    :cond_4
    if-eqz v16, :cond_5

    .line 213
    iget-object v3, v2, Landroid/content/res/ResourcesKey;->mOverrideConfiguration:Landroid/content/res/Configuration;

    invoke-virtual {v11, v3}, Landroid/content/res/Configuration;->updateFrom(Landroid/content/res/Configuration;)I

    .line 220
    :cond_5
    :goto_3
    move-object/from16 v0, p6

    iget-boolean v3, v0, Landroid/content/res/CompatibilityInfo;->isThemeable:Z

    if-eqz v3, :cond_7

    if-eqz v11, :cond_7

    invoke-virtual/range {p8 .. p8}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/pm/PackageManager;->isSafeMode()Z

    move-result v3

    if-nez v3, :cond_7

    .line 221
    iget-object v3, v11, Landroid/content/res/Configuration;->customTheme:Landroid/content/res/CustomTheme;

    if-nez v3, :cond_6

    .line 223
    :try_start_2
    invoke-virtual/range {p8 .. p8}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    invoke-static {v3}, Landroid/content/res/CustomTheme;->getBootTheme(Landroid/content/ContentResolver;)Landroid/content/res/CustomTheme;

    move-result-object v3

    iput-object v3, v11, Landroid/content/res/Configuration;->customTheme:Landroid/content/res/CustomTheme;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 230
    :cond_6
    :goto_4
    iget-object v3, v11, Landroid/content/res/Configuration;->customTheme:Landroid/content/res/CustomTheme;

    if-eqz v3, :cond_7

    .line 231
    iget-object v3, v11, Landroid/content/res/Configuration;->customTheme:Landroid/content/res/CustomTheme;

    move-object/from16 v0, p0

    invoke-direct {v0, v9, v3}, Landroid/app/ResourcesManager;->attachThemeAssets(Landroid/content/res/AssetManager;Landroid/content/res/CustomTheme;)Z

    .line 232
    iget-object v3, v11, Landroid/content/res/Configuration;->customTheme:Landroid/content/res/CustomTheme;

    move-object/from16 v0, p0

    invoke-direct {v0, v9, v3}, Landroid/app/ResourcesManager;->attachIconAssets(Landroid/content/res/AssetManager;Landroid/content/res/CustomTheme;)Z

    .line 236
    :cond_7
    new-instance v8, Landroid/content/res/Resources;

    .end local v8           #r:Landroid/content/res/Resources;
    move-object/from16 v12, p6

    move-object/from16 v13, p7

    invoke-direct/range {v8 .. v13}, Landroid/content/res/Resources;-><init>(Landroid/content/res/AssetManager;Landroid/util/DisplayMetrics;Landroid/content/res/Configuration;Landroid/content/res/CompatibilityInfo;Landroid/os/IBinder;)V

    .line 237
    .restart local v8       #r:Landroid/content/res/Resources;
    move-object/from16 v0, p0

    invoke-direct {v0, v8}, Landroid/app/ResourcesManager;->setActivityIcons(Landroid/content/res/Resources;)V

    .line 245
    monitor-enter p0

    .line 246
    :try_start_3
    move-object/from16 v0, p0

    iget-object v3, v0, Landroid/app/ResourcesManager;->mActiveResources:Landroid/util/ArrayMap;

    invoke-virtual {v3, v2}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v18

    .end local v18           #wr:Ljava/lang/ref/WeakReference;,"Ljava/lang/ref/WeakReference<Landroid/content/res/Resources;>;"
    check-cast v18, Ljava/lang/ref/WeakReference;

    .line 247
    .restart local v18       #wr:Ljava/lang/ref/WeakReference;,"Ljava/lang/ref/WeakReference<Landroid/content/res/Resources;>;"
    if-eqz v18, :cond_a

    invoke-virtual/range {v18 .. v18}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/content/res/Resources;

    move-object v15, v3

    .line 248
    .local v15, existing:Landroid/content/res/Resources;
    :goto_5
    if-eqz v15, :cond_b

    invoke-virtual {v15}, Landroid/content/res/Resources;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/res/AssetManager;->isUpToDate()Z

    move-result v3

    if-eqz v3, :cond_b

    .line 251
    invoke-virtual {v8}, Landroid/content/res/Resources;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/res/AssetManager;->close()V

    .line 252
    monitor-exit p0

    goto/16 :goto_1

    .line 258
    .end local v15           #existing:Landroid/content/res/Resources;
    .end local v18           #wr:Ljava/lang/ref/WeakReference;,"Ljava/lang/ref/WeakReference<Landroid/content/res/Resources;>;"
    :catchall_1
    move-exception v3

    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    throw v3

    .line 205
    .end local v11           #config:Landroid/content/res/Configuration;
    .end local v16           #hasOverrideConfig:Z
    .end local v17           #isDefaultDisplay:Z
    .restart local v18       #wr:Ljava/lang/ref/WeakReference;,"Ljava/lang/ref/WeakReference<Landroid/content/res/Resources;>;"
    :cond_8
    const/16 v17, 0x0

    goto/16 :goto_2

    .line 216
    .restart local v16       #hasOverrideConfig:Z
    .restart local v17       #isDefaultDisplay:Z
    :cond_9
    invoke-virtual/range {p0 .. p0}, Landroid/app/ResourcesManager;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v11

    .restart local v11       #config:Landroid/content/res/Configuration;
    goto :goto_3

    .line 224
    :catch_0
    move-exception v14

    .line 225
    .local v14, e:Ljava/lang/Exception;
    const-string v3, "ResourcesManager"

    const-string v4, "CustomTheme.getBootTheme failed, falling back to system theme"

    invoke-static {v3, v4, v14}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 226
    invoke-static {}, Landroid/content/res/CustomTheme;->getSystemTheme()Landroid/content/res/CustomTheme;

    move-result-object v3

    iput-object v3, v11, Landroid/content/res/Configuration;->customTheme:Landroid/content/res/CustomTheme;

    goto :goto_4

    .line 247
    .end local v14           #e:Ljava/lang/Exception;
    :cond_a
    const/4 v15, 0x0

    goto :goto_5

    .line 256
    .restart local v15       #existing:Landroid/content/res/Resources;
    :cond_b
    :try_start_4
    move-object/from16 v0, p0

    iget-object v3, v0, Landroid/app/ResourcesManager;->mActiveResources:Landroid/util/ArrayMap;

    new-instance v4, Ljava/lang/ref/WeakReference;

    invoke-direct {v4, v8}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v3, v2, v4}, Landroid/util/ArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 257
    monitor-exit p0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    move-object v15, v8

    goto/16 :goto_1
.end method