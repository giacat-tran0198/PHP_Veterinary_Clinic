<!doctype html>
<html lang="en">
<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

  <title>Statistiques</title>
</head>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <a class="navbar-brand" href="#">Clinique</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav">
      <li class="nav-item active">
        <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Statistiques</a>
      </li>
    </ul>
  </div>
</nav>

<body>

  <div class="container-fluid">

    <h1>Statistiques</h1>


    <section>
      <h3>Faire les listes des animaux pour un client donné</h3>

      <form action="<?=$_SERVER['REQUEST_URI']?>" method="post">
        <select name="customerId">
          <?php foreach($data['getCustomers'] as $key=>$customer): ?>
            <option value="<?=$customer["id"]?>"><?=$customer["prenom"]?> - <?=$customer["nom"]?></option>
          <?php endforeach; ?>
        </select>
        <input class="btn btn-success" type="submit">
      </form>

      <?php if ($data['getPetsByCustomerId'] == null) : ?>

        <td collapse=8>Veuillez selectionner un client</td>

      <?php else : ?>
        <table class="table">
          <thead class="thead-dark">
            <tr>
              <th scope="col">id</th>
              <th scope="col">nom</th>
              <th scope="col">poids</th>
              <th scope="col">taille</th>
              <th scope="col">datenaissance</th>
              <th scope="col">age</th>
              <th scope="col">espece</th>
              <th scope="col">classe</th>
            </tr>
          </thead>
          <tbody>
            <?php foreach($data['getPetsByCustomerId'] as $key=>$pet): ?>
              <tr>
                <td><?=$pet["id"]?></td>
                <td><?=$pet["nom"]?></td>
                <td><?=$pet["poids"]?></td>
                <td><?=$pet["taille"]?></td>
                <td><?=$pet["datenaissance"]?></td>
                <td><?=$pet["age"]?></td>
                <td><?=$pet["espece"]?></td>
                <td><?=$pet["classe"]?></td>
              </tr>
            <?php endforeach; ?>

          </tbody>
        </table>

      <?php endif;?>

    </section>

    <br/>

    <section>

      <h3>Nombre d' animaux par classe d'espèce</h3>

      <table class="table">
        <thead class="thead-dark">
          <tr>
            <th scope="col">Espece</th>
            <th scope="col">Nombre</th>
          </tr>
        </thead>
        <tbody>
          <?php foreach($data['getPetsByspecie'] as $key=>$pet): ?>
            <tr>
              <td><?=$pet["nom"]?></td>
              <td><?=$pet["nombre"]?></td>
            </tr>
          <?php endforeach; ?>
        </tbody>
      </table>

    </section>

    <br/>

    <section>

      <h3>Selection des animaux d'un âge compris entre une valeur inf et une valeur max </h3>


      <form action="<?=$_SERVER['REQUEST_URI']?>" method="post">
        <label for="ageMin">Age min</label>
        <input type="number" name="ageMin"><br>
        <label for="ageMax">Age max</label>
        <input type="number" name="ageMax"><br>
        <input class="btn btn-success" type="submit">
      </form>

      <br/>

      <?php if ($data['getPetsBetweenAge'] == null) : ?>

        <td collapse=8>Veuillez saisir un âge min et max</td>

      <?php else : ?>
        <table class="table">
          <thead class="thead-dark">
            <tr>
              <th scope="col">id</th>
              <th scope="col">nom</th>
              <th scope="col">poids</th>
              <th scope="col">taille</th>
              <th scope="col">datenaissance</th>
              <th scope="col">age</th>
              <th scope="col">espece</th>
              <th scope="col">classe</th>
            </tr>
          </thead>
          <tbody>
            <?php foreach($data['getPetsBetweenAge'] as $key=>$pet): ?>
              <tr>
                <td><?=$pet["id"]?></td>
                <td><?=$pet["nom"]?></td>
                <td><?=$pet["poids"]?></td>
                <td><?=$pet["taille"]?></td>
                <td><?=$pet["datenaissance"]?></td>
                <td><?=$pet["age"]?></td>
                <td><?=$pet["espece"]?></td>
                <td><?=$pet["classe"]?></td>
              </tr>
            <?php endforeach; ?>

          </tbody>
        </table>

      <?php endif;?>


    </section>

    <br/>
    <br/>
    <br/>

  </div>

  <!-- Optional JavaScript -->
  <!-- jQuery first, then Popper.js, then Bootstrap JS -->
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>
