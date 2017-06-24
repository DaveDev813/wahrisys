
<!-- Navigation -->
<nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
    <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="index.html"><i class="glyphicon glyphicon-send"></i>&nbsp WAHRI SYS - Developer</a>
    </div>
    <!-- /.navbar-header -->

    <ul class="nav navbar-top-links navbar-right">
        <li class="dropdown">
            <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
            </a>
            <ul class="dropdown-menu dropdown-user">
                <li><a href="#"><i class="fa fa-user fa-fw"></i> User Profile</a>
                </li>
                <li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a>
                </li>
                <li class="divider"></li>
                <li id="logout"><i class="fa fa-sign-out fa-fw"></i> Logout
                </li>
            </ul>
            <!-- /.dropdown-user -->
        </li>
        <!-- /.dropdown -->
    </ul>
    <!-- /.navbar-top-links -->

    <div class="navbar-default sidebar" role="navigation">
        <div class="sidebar-nav navbar-collapse">
            <ul class="nav" id="side-menu">
                <?php foreach ($navData as $navIndex => $navDatu): ?>
                    <li>
                        <a href="<?php echo site_url($navDatu['href']); ?>" data-base-location="<?php echo $navDatu['href'];?>"><i class="<?php echo $navDatu['icon']; ?>"></i> <?php echo $navDatu['name']; ?><?php if (isset($navDatu['second_level'])):?><span class="fa arrow"></span><?php endIf;?></a>
                        <?php if (isset($navDatu['second_level'])): $secondLevel = $navDatu['second_level']; ?>
                            <ul class="nav nav-second-level">
                                <?php foreach ($secondLevel as $secondLevelIndex => $secondLevelItem): ?>
                                    <li> 
                                        <a href="<?php echo site_url($secondLevelItem['href']); ?>" data-base-location="<?php echo $secondLevelItem['href'];?>"><?php echo $secondLevelItem['name']; ?><?php if (isset($secondLevelItem['third_level'])): ?><span class="fa arrow"></span><?php endIf; ?></a> 
                                        <?php if (isset($secondLevelItem['third_level'])): $thirdLevel = $secondLevelItem['third_level']; ?>
                                            <ul class="nav nav-third-level">
                                                <?php foreach ($thirdLevel as $thirdLevelIndex => $thirdLevelItem): ?>
                                                    <li><a href="<?php echo site_url($thirdLevelItem['href']); ?>" data-base-location="<?php echo $thirdLevelItem['href'];?>"><?php echo $thirdLevelItem['name']; ?></a></li>
                                                <?php endforeach; ?>
                                            </ul>
                                            <?php endIf; ?>
                                    </li>
                                <?php endforeach; ?>
                            </ul>
                            <?php endIf; ?>
                    </li>
                <?php endforeach; ?>
            </ul>
        </div>
        <!-- /.sidebar-collapse -->
    </div>
    <!-- /.navbar-static-side -->
</nav>

<!-- Page Content -->
<div id="page-wrapper">