<!DOCTYPE html>
<html lang = "en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="globals.css" />
    <link rel="stylesheet" href="ranking.css" />
    <link rel="stylesheet" href="nav_footer.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <title>Rankings</title>
</head>

<body>
    <!-- navbar -->
    <div class="nav-bar">
        <div class="text-wrapper"><a style="text-decoration:none; color:white;" href="Home.html" class="link">LOGO</a></div>

        <div class="login">
            <a href="#" class="link">LOGIN </a>          
        </div>
        
        <div class="ranking">
            <i class="bi bi-graph-up"></i>
            <a href="countrypublicationrankings.php" class="link">Ranking</a>
        </div>
        <div class="search">
            <i class="bi bi-search"></i>
            <a href="Home.html" class="link">Search</a>
        </div>
      </div>
      <!-- end navbar -->

    <div class="container">
        <div class="child-1">
            <p>Menu</p>
            <ul class="menu">
                <li class="list-m">การจัดอันดับมหาวิทยาลัย
                    <ul class="menu-l">
                        <li class="menu-l-m"><a href="#">การจัดอันดับมหาวิทยาลัยทั่วโลก</a></li>
                        <li class="menu-l-m"><a href="#">การจัดอันดับมหาวิทยาลัยในประเทศไทย</a></li>
                    </ul>
                </li>
                <li class="list-m">การจัดอันดับงานวิจัย
                    <ul class="menu-l">
                        <li class="menu-l-m"><a href="#">การจัดอันดับงานวิจัยในประเทศไทย</a></li>
                        <li class="menu-l-m"><a href="#">การจัดอันดับงานวิจัยในมหาวิทยาลัยเดียวกัน</a></li>
                        <li class="menu-l-m"><a href="#">การจัดอันดับงานวิจัยในสาขาวิชาเดียวกัน</a></li>
                        <li class="menu-l-m"><a href="#">การจัดอันดับงานวิจัยที่มีผู้อ้างอิง</a></li>
                        <li class="menu-l-m"><a href="#">การจัดอันดับงานวิจัยรายปี</a></li>
                    </ul>
                </li>
                <li class="list-m">การจัดอันดับผู้เขียนงานวิจัย
                    <ul class="menu-l">
                        <li class="menu-l-m"><a href="#">การจัดอันดับผู้ที่มีจำนวนงานวิจัยมากที่สุด</a></li>
                        <li class="menu-l-m"><a href="#">การจัดอันดับชื่อแรกในงานวิจัย</a></li>
                        <li class="menu-l-m"><a href="#">การจัดอันดับผู้เขียนที่มีผู้ติดตามมากที่สุด</a></li>
                        <li class="menu-l-m"><a href="#">การจัดอันดับผู้เขียนงานวิจัยในคณะเดียวกัน</a></li>
                    </ul>
                </li>
            </ul>
        </div>
        <!-- end child-1 -->


        <div class="child-2">

        <h1>การจัดอันดับมหาวิทยาลัยทั่วโลก</h1>
            <table>

                <thead>
                    <th>อันดับ</th>
                    <th>ประเทศ</th>
                    <!-- <th>CountryID</th>
                    <th>Year</th> -->
                </thead>
                <tbody>
                    
                    <?php
                    $servername = 'localhost';
                    $username = 'root';
                    $password = '';
                    $dbname = 'sa-project';

                    $conn = mysqli_connect($servername, $username, $password, $dbname);

                    if (!$conn) {
                        die("Connection : failed (เชื่อมต่อฐานข้อมูล ไม่ สำเร็จ)" . mysqli_connect_error());
                    }

                    $sql2 = "SELECT CountryName,Ranking,Year FROM `countrypublicationrankings`,Country,Year WHERE Country_CountryId = CountryId AND Year_YearId = YearId AND Year = 2023;";
                    $result2 = $conn->query($sql2);

                    ?>
                    <?php if ($result2->num_rows > 0) {
                        $rank = 1;
                        while ($row2 = $result2->fetch_assoc()) {
                            ?>
                            <tr>
                                <td>
                                    <?php echo "#" . $row2["Ranking"]; ?>
                                </td>
                                <td>
                                    <?php echo $row2["CountryName"]; ?>
                                </td>
                                <?php $rank++;
                        } ?>
                        </tr>

                    </tbody>

                </table>
                <?php
                    } else {
                        echo "0 results";
                    }
                    $conn->close();

                    ?>
        </div>
        <!-- end child-2 -->

    </div>

    <!-- footer -->
    <footer>
        <div class="row">
        <div class="col-md-4">
            <h2>About us</h2>
            <ul class="about">
                <li><a href="#">About us</a></li>
            </ul>
        </div>
        <div class="col-md-4">
            <h2>Language</h2>
            <ul class="lang">
               <li><a href="#">English</a></li>
               <li><a href="#">ภาษาไทย</a></li> 
            </ul>
        </div>
        <div class="col-md-4">
            <h2>Costomer Service</h2>
            <ul class="cservice">
                <li><a href="#">Help</a></li>
                <li><a href="#">Tutorials</a></li>
                <li><a href="#">Contact us</a></li>
            </ul>
        </div>
        </div>
        <br>
        <div class="infor3">
            <span>วิทยาลัยการคอมพิวเตอร์</span><br>
            <span>123 ถ.มิตรภาพ ต.เมือง จ.ขอนแก่น 40002</span><br>
            <span>โทรศัพท์ 043-009700 ต่อ 44456, 44457</span><br>
            <span>Hot Line. 089-7102651, 089-7102945</span>
        </div>
        <!-- end footer -->

        

</body>

</html>