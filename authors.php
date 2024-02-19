<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="globals.css" />
    <link rel="stylesheet" href="authors.css">
    <link rel="stylesheet" href="nav_footer.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <title>Authors</title>
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

       <!-- author-information -->
       <div class="author-information">
        <div class="flexcontainer">
            <div class="author-img">
                <img src="profile.jpg" alt="">
            </div>
          
            <?php
            require('connectdb.php');
            $sql = 'SELECT AuthorShortName,EducationHistoryId,BachelorDegree,FieldName
                    FROM Authors,EducationHistory,Field
                    WHERE Authors_Id = "A0001"
                    AND Authors.EducationHistory_EducationHistoryId  = EducationHistory.EducationHistoryId ';

            $result = $conn->query($sql);
            // $conn->close();
        ?>
    
        <div class="side">
          <p class="text">

            <span class="name">
                <?php    $row = $result->fetch_assoc(); 
                        echo $row["AuthorShortName"] ;
                 ?> <br>
            </span>
            <span class="text-wrapper-5"><a href="#" class="link">แก้ไขโปรไฟล์</a></span>
          </p>

          <p class="text">
            <span class="text-wrapper-7">ประวัติการศึกษา<br /></span>
          </p>
          <span class="text-wrapper-8">
            <?php if ($result->num_rows > 0) {
                $row = $result->fetch_assoc(); 
                echo $row["BachelorDegree"];
            } ?> 
        </span>

          <p class="text">
            <span class="text-wrapper-7">สาขาวิชา<br /></span>
          </p>
            <span class="text-wrapper-8">
                <?php if ($result->num_rows > 0) {
                    while ($row = $result->fetch_assoc()){
                        echo " • ".$row["FieldName"] ;
                    }
                    
                }?>
            </span>    
            </div>

        <!--follow button -->
        <div class="followbutton-wrapper">
                <div class="text-wrapper-10">ติดตาม <i class="bi bi-person-plus"></i></div>
        </div>
          <!-- end followbutton -->
        </div>
        <!-- end flexcontainer -->
      </div>
      <!-- end author-information -->


      <!-- container -->
      <div class="container">
        <div class="text-wrapper-11">การอ้างอิง
          <?php
                    $sql6 = "SELECT NumberOfCitations FROM paperstatistics,publication WHERE publication.PaperStatistics_StatID = paperstatistics.StatID 
                    AND PaperStatistics_Year_YearId = paperstatistics.Year_YearId;";
                    $result6 = mysqli_query($conn, $sql6);
                    if (mysqli_num_rows($result6) > 0) {
                    // วนลูปเพื่อดึงข้อมูลแต่ละแถว
                      while ($row6 = mysqli_fetch_assoc($result6)) {
                      echo $row6['NumberOfCitations'] . "<br>";
                    }
                    } else {
                      echo "No results found";
                    }
                  ?>
          </div>
          <div class="text-wrapper-12">สิ่งตีพิมพ์ 46</div>     
      </div>
      <!-- end container -->

      <!-- graph -->
        <div class="graph">
            <div class="text-wrapper-13">แนวโน้มเอกสารและการอ้างอิง</div> 
            
            <!-- bar graph -->
            <div class="group-3">
            <div class="overlap-3">
              <div class="text-wrapper-16">&nbsp;&nbsp;สิ่งตีพิมพ์</div>
              <div class="rectangle-3"></div>
            </div>
            <div class="overlap-4">
              <div class="text-wrapper-17">การอ้างอิง</div>
              <div class="rectangle-4"></div>
            </div>
            <script src="https://cdn.jsdelivr.net/npm/echarts@5.2.1/dist/echarts.min.js"></script>
            <div id="barChart" style="width: 1000px; height: 400px;"></div>
            <script type="text/javascript">
            var categories = ['2015', '2016', '2017', '2018', '2019'];
            var data = [20, 10,0, 9, 30];
            var chart = echarts.init(document.getElementById('barChart'));
            var option = {
                title: {
                text: 'กราฟแท่ง',
                x: 'center'
                },
                xAxis: {
                data: categories,
                axisLabel: {
                    rotate: 45
                }
                },
                yAxis: {},
                series: [{
                type: 'bar',
                data: data,
                label: {
                    show: true,
                    position: 'top'
                }
                }]
            };
            chart.setOption(option);
            </script>
          </div>
          <!-- end bar graph -->

          <!-- qtr -->
          <!-- <div class="group-4">
            <div class="group-5">
              <div class="overlap-group-3">
                <div class="element-2">&nbsp;&nbsp;&nbsp;&nbsp;ควอไทล์ที่ 2</div>
                <div class="rectangle-5"></div>
              </div>
              <div class="overlap-5">
                <div class="text-wrapper-18">ควอไทล์ที่ 1</div>
                <div class="rectangle-6"></div>
              </div>
            </div>
            <div class="group-6">
              <div class="overlap-group-3">
                <div class="element-2">&nbsp;&nbsp;&nbsp;&nbsp;ควอไทล์ที่ 4</div>
                <div class="rectangle-7"></div>
              </div>
              <div class="overlap-5">
                <div class="text-wrapper-18">ควอไทล์ที่ 3</div>
                <div class="rectangle-8"></div>
              </div>
            </div>
          </div> -->

          <!--  -->
          <!-- <div class="overlap-6">
            <div class="rectangle-9"></div>
            <div class="rectangle-10"></div>
            <div class="rectangle-11"></div>
            <div class="rectangle-12"></div>
            <div class="rectangle-13"></div>
            <div class="rectangle-14"></div>
            <div class="rectangle-15"></div>
            <div class="rectangle-16"></div>
            <div class="rectangle-17"></div>
            <div class="rectangle-18"></div>
            <div class="rectangle-19"></div>
            <div class="rectangle-20"></div>
            <div class="rectangle-21"></div>
            <img class="line-13" src="img/line-28.svg" />
          </div>
          <div class="text-wrapper-19">2011</div>
          <div class="text-wrapper-20">2012</div>
          <div class="text-wrapper-21">2013</div>
          <div class="text-wrapper-22">2014</div>
          <div class="text-wrapper-23">2015</div>
          <div class="text-wrapper-24">2016</div>
          <div class="text-wrapper-25">2017</div>
          <div class="text-wrapper-26">2018</div>
          <div class="text-wrapper-27">2019</div>
          <div class="text-wrapper-28">2020</div>
          <div class="text-wrapper-29">2021</div>
          <div class="text-wrapper-30">2022</div>
          <div class="text-wrapper-31">2023</div>
          <img class="sortby-button" src="img/sortby-button.png" />
          <div class="text-wrapper-32">Computer Science</div>
            <div class="overlap-group-wrapper">
          </div> -->
          <!--  -->
          <!-- end qtr -->

          <!-- list public -->
          <div class="list-public">
            <div class="span-wrapper-1">สิ่งตีพิมพ์</div> <!-- ต้องอยู่ข้างบนก่อนแสดงข้อมูล -->
            <div class="overlap-10">
                <div class="flexcontainer-3">
                  <span class="span-wrapper-2">
                  <?php
                    $sql99 = "SELECT title FROM publication;";
                    $result99 = mysqli_query($conn, $sql99);
                    if (mysqli_num_rows($result99) > 0) {
                    // วนลูปเพื่อดึงข้อมูลแต่ละแถว
                        while ($row99 = mysqli_fetch_assoc($result99)) {
                    // แสดงข้อมูล title
                        echo $row99['title'] . "<br>";
                    }
                    } else {
                        echo "No results found";
                    }
                    ?>
                  </span>
                 
                    <span class="text-wrapper-6">
                    <?php
                    $sql1 = "SELECT AuthorShortName FROM publication,authors WHERE publication.Publication_Authors_PublicationAuthorsId
                    = authors.Publication_Authors_PublicationAuthorsId;";
                    $result1 = mysqli_query($conn, $sql1);
                    if (mysqli_num_rows($result1) > 0) {
                    // วนลูปเพื่อดึงข้อมูลแต่ละแถว
                        while ($row1 = mysqli_fetch_assoc($result1)) {
                        echo $row1['AuthorShortName'] . "<br>";
                    }
                    } else {
                        echo "No results found";
                    }
                    ?>
                    </span>
                    <span class="text-wrapper-6">Data, 2023, 8(5), 90</span>

                    </div>
                     <!-- end flexcontainer-3 -->

                    <div class="overlap-11">
                        <div class="text-wrapper-34">การอ้างอิง</div>
                        <div class="text-wrapper-35">1</div>
                        <div class="text-wrapper-36">93%</div>
                        <div class="text-wrapper-37">เปอร์เซ็นต์ไทล์</div>
                    </div>
                  
                </div>
                <!-- end overlap-10 -->
                
                <!-- overlap-12 -->
                <div class="overlap-12">
            <div class="list">
              <div class="flexcontainer-2">
                  <span class="span-wrapper">
                  <?php
                   $sql2= "SELECT title FROM publication;";
                   $result2 = mysqli_query($conn, $sql2);
                   if (mysqli_num_rows($result2) > 0) {
                   // วนลูปเพื่อดึงข้อมูลแต่ละแถว
                       while ($row2 = mysqli_fetch_assoc($result2)) {
                   // แสดงข้อมูล title
                       echo $row2['title'] . "<br>";
                   }
                   } else {
                       echo "No results found";
                   }

                   ?>
                  </span>
                  <span class="text-wrapper-6"><?php
                    $sql3 = "SELECT AuthorShortName FROM publication,authors WHERE publication.Publication_Authors_PublicationAuthorsId
                    = authors.Publication_Authors_PublicationAuthorsId;";
                    $result3 = mysqli_query($conn, $sql3);
                    if (mysqli_num_rows($result3) > 0) {
                    // วนลูปเพื่อดึงข้อมูลแต่ละแถว
                        while ($row3 = mysqli_fetch_assoc($result3)) {
                        echo $row3['AuthorShortName'] . "<br>";
                    }
                    } else {
                        echo "No results found";
                    }
                ?>
        </span>
                <span class="text-wrapper-6">Data, 2023, 8(5), 90</span>
              </div>
              <div class="overlap-13">
                
                <div class="text-wrapper-34">การอ้างอิง</div>
                <div class="text-wrapper-35">1</div>
                <div class="text-wrapper-36">93%</div>
                <div class="text-wrapper-37">เปอร์เซ็นต์ไทล์</div>
              </div>
            </div> 
          </div>
          <!-- end overlap-12 -->

          </div>
          <!-- end list-public -->

        </div>  
      <!-- end graph -->

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