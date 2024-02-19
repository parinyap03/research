<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="globals.css" />
  <link rel="stylesheet" href="SelectHome.css" />
  <link rel="stylesheet" href="nav_footer.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
  <title>SelectHome</title>
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
      <div class="group">
        <div class="element">ค้นพบทั้งหมด148 งานวิจัย</div>
        <a href="#">
          <p>advance search</p>
        </a>
      </div>
      <ul class="menu">
        <li class="list-m">กำหนดจำนวนงานวิจัยที่ต้องการแสดง</li>
        <li class="list-m">ปีที่ตีพิมพ์</li>
        <li class="list-m">แหล่งที่มา</li>
        <li class="list-m">ผู้แต่ง</li>
        <li class="list-m">สาขาวิชา</li>
        <li class="list-m">ค้นหางานวิจัยจากหมายเลข ISSN ISBN DOI ORCID</li>

      </ul>
    </div>
    <!-- end child-1 -->


    <div class="child-2">

      <div class="overlap-2">
        <div class="search01">
          <div class="search02">
            <input type="text" class="form-control02" placeholder="Search">
          </div>
        </div>
      </div>

      <div class="overlap-111">
        <?php
        require('connectdb.php');

        $sql = 'SELECT 
                (SELECT authors.AuthorShortName 
                FROM authors 
                WHERE authors.Authors_Id = 
                (SELECT author_mapping.Authors_Authors_Id 
                FROM publication, publication_authors, author_mapping, authors
                WHERE publication.Publication_Authors_PublicationAuthorsId = publication_authors.PublicationAuthorsId
                AND publication_authors.PublicationAuthorsId = author_mapping.Authors_Publication_Authors_PublicationAuthorsId
                AND author_mapping.Authors_Authors_Id = authors.Authors_Id
                AND author_mapping.Authors_Publication_Authors_PublicationAuthorsId = authors.Publication_Authors_PublicationAuthorsId
                LIMIT 1)
            ) AS AuthorsName,
                (SELECT publication.Title 
                FROM publication 
                WHERE publication.Publication_Authors_PublicationAuthorsId = 
                (SELECT author_mapping.Authors_Publication_Authors_PublicationAuthorsId 
                FROM publication, publication_authors, author_mapping, authors
                WHERE publication.Publication_Authors_PublicationAuthorsId = publication_authors.PublicationAuthorsId
                AND publication_authors.PublicationAuthorsId = author_mapping.Authors_Publication_Authors_PublicationAuthorsId
                AND author_mapping.Authors_Authors_Id = authors.Authors_Id
                AND author_mapping.Authors_Publication_Authors_PublicationAuthorsId = authors.Publication_Authors_PublicationAuthorsId
                LIMIT 1)
            ) AS Title,
                (SELECT publication.PublishYear 
                FROM publication 
                WHERE publication.Publication_Authors_PublicationAuthorsId = 
                (SELECT author_mapping.Authors_Publication_Authors_PublicationAuthorsId 
                FROM publication, publication_authors, author_mapping, authors
                WHERE publication.Publication_Authors_PublicationAuthorsId = publication_authors.PublicationAuthorsId
                AND publication_authors.PublicationAuthorsId = author_mapping.Authors_Publication_Authors_PublicationAuthorsId
                AND author_mapping.Authors_Authors_Id = authors.Authors_Id
                AND author_mapping.Authors_Publication_Authors_PublicationAuthorsId = authors.Publication_Authors_PublicationAuthorsId
                LIMIT 1)
            ) AS PublishYear,
                (SELECT publication.University 
                FROM publication 
                WHERE publication.Publication_Authors_PublicationAuthorsId = 
                (SELECT author_mapping.Authors_Publication_Authors_PublicationAuthorsId 
                FROM publication, publication_authors, author_mapping, authors
                WHERE publication.Publication_Authors_PublicationAuthorsId = publication_authors.PublicationAuthorsId
                AND publication_authors.PublicationAuthorsId = author_mapping.Authors_Publication_Authors_PublicationAuthorsId
                AND author_mapping.Authors_Authors_Id = authors.Authors_Id
                AND author_mapping.Authors_Publication_Authors_PublicationAuthorsId = authors.Publication_Authors_PublicationAuthorsId
                LIMIT 1)
            ) AS University
            FROM 
                publication, publication_authors, author_mapping, authors
            WHERE 
                publication.Publication_Authors_PublicationAuthorsId = publication_authors.PublicationAuthorsId
                AND publication_authors.PublicationAuthorsId = author_mapping.Authors_Publication_Authors_PublicationAuthorsId
                AND author_mapping.Authors_Authors_Id = authors.Authors_Id
                AND author_mapping.Authors_Publication_Authors_PublicationAuthorsId = authors.Publication_Authors_PublicationAuthorsId;';

        $objQuery = mysqli_query($conn, $sql) or die("Error Query [" . $sql . "]");

        ?>
        <table class="responsive-table">
          <tr class="table-header">
            <td class="col col-1">Title</td>
            <td class="col col-2">Author</td>
            <td class="col col-3">University</td>
            <td class="col col-4">PublishYear</td>
          </tr>
          <?php
          $i = 1;
          while ($objResult = mysqli_fetch_array($objQuery)) {
            ?>
            <tr class="table-row">
              
              <td class="col col-1 trow" data-label="Title">
              <a style="text-decoration:none; color:black;"
               href="research-detial.php">
                <?php echo $objResult["Title"]; ?></a>
              </td>
              <td class="col col-2 trow" data-label="Authors">
                <a style="text-decoration:none; color:black;"
               href="authors.php">
                <?php echo $objResult["AuthorsName"]; ?></a>
              </td>
              <td class="col col-3 trow" data-label="University">
                <?php echo $objResult["University"]; ?>
              </td>
              <td class="col col-4 trow" data-label="PublishYear">
                <?php echo $objResult["PublishYear"]; ?>
              </td>
          
            </tr>
            <?php
            $i++;
          }
          ?>
          <!-- </ul> -->
          <?php
          mysqli_close($conn); // ปิดฐานข้อมูล 
          ?>
        </table>
      </div>

    </div>
    <!-- end child-2 -->

  </div>
  <!-- ---------------------- -->

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