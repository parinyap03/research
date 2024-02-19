<!DOCTYPE html>
<html lang = "en">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="globals.css" />
    <link rel="stylesheet" href="research-detail.css" />
    <link rel="stylesheet" href="nav_footer.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    
  </head>
  <?php require('connectdb.php'); ?>
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

      <!-- start infor -->
    <div class="research">

    <!-- div head -->
    
    <!-- back to result -->
        <p class="back-to-results">
          <span class="text-wrapper-13"><a href="SelectHome.php "> <i class="bi bi-chevron-left"></i> Back to results</a> </span>
        </p>

      <div class="div1">
        <!-- publication name -->
        <p class="name-publication">
        <?php
          $sql = "SELECT title FROM publication;";
          $result = mysqli_query($conn, $sql);
          if (mysqli_num_rows($result) > 0) {
          // วนลูปเพื่อดึงข้อมูลแต่ละแถว
            while ($row = mysqli_fetch_assoc($result)) {
          // แสดงข้อมูล title
            echo $row['title'] . "<br>";
          }
          } else {
            echo "No results found";
          }
          ?>
        </p>

        <!-- author name -->
          <div class="text-wrapper-7">
            <p>Auther</p>
            <p class = authorName>
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
            </p>
          </div>

        <div class="overlap-2">
          <div class="overlap-3">

          <!-- ICES -->
          <p class="ICSEC">
            <span class="text-wrapper-4">
              ICSEC 2015 - 19th International Computer Science and Engineering Conference: Hybrid Cloud Computing: A
              New Approach for Big Data Era</span
            ><br><br>
            <span class="text-wrapper-5">
              8 February 2016 Article number 740143119th International Computer Science and Engineering Conference,
              ICSEC 2015Chiang Mai23 November 2015through 26 November 2015 Code 119341</span
            ><br><br>
            <span class="text-wrapper-5">
              Department of Computer Science, Faculty of Science, Khon Kaen University, Khon Kaen, 40002, Thailand
            </span>
          </p>
           

            <!-- citations count -->
            <div class="flexcontainer">
                <span class="span" id="span1">
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
                  </span>
                  <span class="span">Citations</span>
            </div>
            <!-- end citation counts -->
           
          </div>
        </div>
      </div>
      
      <!-- end div1 name head -->
       
      <!-- div2 -->
      <div class="div2">
        <!-- View at publisher site -->
        <p class="document-type">
         <a
          href="https://www.scopus.com/redirect/linking.uri?targetURL=https%3a%2f%2fdoi.org%2f10.1109%2fICSEC.2015.7401431&locationID=2&categoryID=4&eid=2-s2.0-84964330691&issn=&linkType=ViewAtPublisher&year=2016&origin=resultslist&dig=303c2c4b1a5685cda5042d394ae81637"
          target="_blank"
          rel="noopener noreferrer">
         View at Publisher <i class="bi bi-box-arrow-up-right"></i> </a> <br><br>
          <span class="text-wrapper-9">Document type<br /></span>
          <span class="text-wrapper-5">Conference Paper<br /></span>
          <span class="text-wrapper-9">Source type<br /></span>
          <span class="text-wrapper-5">Conference Proceedings<br /></span>
          <span class="text-wrapper-9">ISBN<br /></span>
          <span class="text-wrapper-5">
            <?php
              $sql3 = "SELECT isbn FROM publication;";
              $result3 = mysqli_query($conn, $sql3);
              if (mysqli_num_rows($result3) > 0) {
              // วนลูปเพื่อดึงข้อมูลแต่ละแถว
                while ($row3 = mysqli_fetch_assoc($result3)) {
                echo $row3['isbn'] . "<br>";
              }
              } else {
                echo "No results found";
              }
            ?></span>
          <span class="text-wrapper-9">DOI<br /></span>
          <span class="text-wrapper-5">
            <?php
              $sql4 = "SELECT doi FROM publication;";
              $result4 = mysqli_query($conn, $sql4);
              if (mysqli_num_rows($result4) > 0) {
              // วนลูปเพื่อดึงข้อมูลแต่ละแถว
                while ($row4 = mysqli_fetch_assoc($result4)) {
                echo $row4['doi'] . "<br>";
              }
              } else {
                echo "No results found";
              }
            ?></span>
          <span class="text-wrapper-9">Publisher<br /></span>
          <span class="text-wrapper-5">
          <?php
              $sql5 = "SELECT publisher FROM publication;";
              $result5 = mysqli_query($conn, $sql5);
              if (mysqli_num_rows($result5) > 0) {
              // วนลูปเพื่อดึงข้อมูลแต่ละแถว
                while ($row5 = mysqli_fetch_assoc($result5)) {
                echo $row5['publisher'] . "<br>";
              }
              } else {
                echo "No results found";
              }
            ?></span>
          <span class="text-wrapper-9">Sponsors<br />Original language<br /></span>
          <span class="text-wrapper-5">English</span>
        </p>
        <!-- end site -->
        
        <!-- abstract site-->
        <div class="overlap-4">
          <div class="abstract">Abstract</div>
          <div class="abstract-infor">
          <?php
              $sql2 = "SELECT Abstract FROM publication;";
              $result2 = mysqli_query($conn, $sql2);
              if (mysqli_num_rows($result2) > 0) {
              // วนลูปเพื่อดึงข้อมูลแต่ละแถว
                while ($row2 = mysqli_fetch_assoc($result2)) {
              // แสดงข้อมูล title
                echo $row2['Abstract'] . "<br>";
              }
              } else {
                echo "No results found";
              }

            ?>
          </p>
          </div>

          <!-- after abstract -->       
          <p class="element-bace-r-mdl-p-nist">
          <div class="text-wrapper-8">References (10) </br>
           <span class="text-wrapper-12"
            >1 Bace, R., Mdl, P.Nist special publication on intrusion detection systems(2001) BOOZ-ALLEN and Hamilton
            INC MCLEAN VA.
            </span>
            <a
            href="https://www.scopus.com/search/submit/citedby.uri?eid=2-s2.0-84964330691&refeid=2-s2.0-2642515264&src=s&origin=reflist&refstat=dummy"
            target="_blank"
            rel="noopener noreferrer">
            <span class="text-wrapper-13">Cited 199 times</span></a>
          </p>

          <p class="element-scarfone-k-mdl-p">
           <span class="text-wrapper-12"
            >2 Scarfone, K., Mdl, P.(2007) Guide to Intrusion Detection and Prevention Systems (Idps). NIST Special
            Publication 2007, 800, p. 94.
          </span>
          <a
            href="https://www.scopus.com/search/submit/citedby.uri?eid=2-s2.0-84964330691&refeid=2-s2.0-42449117164&src=s&origin=reflist&refstat=dummy"
            target="_blank"
            rel="noopener noreferrer"
            ><span class="text-wrapper-13">Cited 659 times</span></a
          >
          <span class="text-wrapper-12">.</span>
          
            </div>
            </div>  
            </div>
        </p>
          

        <!--close php  -->
        <?php
          mysqli_close($conn);
        ?>

      <!-- div end research -->
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
