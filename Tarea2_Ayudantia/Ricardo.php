<!DOCTYPE html>
<html>
    <head>
        <title>This is test</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="stylesheet2.css">
    
    </head>
    <body>
        <div id='contenido'>
            <header>
                <hgroup>
                    <h1>Tarea Nº2</h1>
                </hgroup>
             <nav>
                <ul>
                    <li><a href='index.php'>Claudio Acuña</a></li>
                    <li><a href='Ricardo.php'>Ricardo Soto</a></li>
                    <li><a href='Jose.php'>Jose Acuña</a></li>
                </ul>
            </nav>
            </header>
            <section>
                <div id='textopr'>
                    <article>
                        <div class="Foto"><em>Jose</em><img src="/Tarea2_Ayudantia/Ricardo.jpg" width='160' height='150' align="right"></div>
                        <hgroup>
                            <h1>Ricardo Soto</h1>
                        </hgroup>
                            <p>Nombre: Ricardo Soto</p>
                            <p> Rut:nnnnnn-n</p>
                           <p> Carrera:Ingenieria Civil en Computación e Informatica.</p>
                          <p>  Asignatura: Ingenieria en Software</p>
                    </article>
                    <aside>
                        <p>
                            Visita Nuestro Repositorio <a href="https://github.com/claudioac/Ing_Software_2013_2"> Github</a>
                        </p>

                    </aside>
                </div>
            </section>
             <div id="frases">
                    <footer>
                        <p>
                          
                        <?
                        
                         
                         $vector = array(
                             1=>"”Siempre ha de haber dos, ni más ni menos. Un maestro, y un aprendiz.” Maestro Yoda.",
                             2=>"”No lo intentes. Hazlo, o no lo hagas, pero no lo intentes.” Maestro Yoda",
                             3=>"”Si hablas con Dios eres religioso, si Dios habla contigo, eres psicópata.”  Gregory House",
                             4=>"”Gánate el respeto de los demás teniendo la osadía de ser tú mismo.”  Gregory House",
                             5=>"”El amigo ha de ser como el dinero, que antes de necesitarlo, se sabe el valor que tiene.” Socrátes",
                             6=>"” La ciencia humana consiste más en destruir errores que en descubrir verdades.” Socrátes",
                         );
                         $numero = rand(1,6);
                         echo "$vector[$numero]";
                         
                         ?>
                        </p>
                    </footer>
            </div>

        </div>

    </body>
</html>
