<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>FinanceApp - Contato</title>
        <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/img/logo.png">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Styles/Components/header.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Styles/Components/footer.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Styles/contato.css"/>     
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
    </head>
    <body>        
        <jsp:include page="/Components/header.jsp"/>
        
        <div class="container-primario">
            <div class="container-primario__container-secundario">
                <div class="container-primario__container-secundario__titulo">
                    <a>Dúvidas? Contate-nos!</a>  
                </div>
                <div class="container-conteudo">
                    <div class="container-conteudo__item">
                        <div class="container-conteudo__item__nome">
                            <label>Nome:</label>
                            <span>Gustavo F. Vetter</span>
                        </div>
                        <div class="container-conteudo__item__email">
                            <label>Email:</label>
                            <a href="mailto:vetter.gustavo@gmail.com">vetter.gustavo@gmail.com</a>
                        </div>
                        <div class="container-conteudo__item__social">
                            <label>Linkedin:</label>
                            <a href="https://www.linkedin.com/in/gustavo-f-vetter-012090225/">@gustavo-f-vetter-012090225</a>
                        </div>          
                    </div>
                    <div class="container-conteudo__item"> 
                        <div class="container-conteudo__item__nome">
                            <label>Nome:</label>
                            <span>Héctor Júlio Martins de França</span>
                        </div>
                        <div class="container-conteudo__item__email">
                            <label>Email:</label>
                            <a href="mailto:hectorjuliomartinsdefranca@hotmail.com">hectorjuliomartinsdefranca@hotmail.com</a>
                        </div>
                        <div class="container-conteudo__item__social">
                            <label>Linkedin:</label>
                            <a href="https://www.linkedin.com/in/hectorfranca/">@hectorfranca</a>
                        </div>
                    </div>
                    <div class="container-conteudo__item">
                        <div class="container-conteudo__item__nome">
                            <label>Nome:</label>
                            <span>Lúcio de Freitas Pereira</span>
                        </div>
                        <div class="container-conteudo__item__email">
                            <label>Email:</label>
                            <a href="mailto:luciodfp@gmail.com">luciodfp@gmail.com</a>
                        </div>
                        <div class="container-conteudo__item__social">
                            <label>Linkedin:</label>
                            <a href="https://www.linkedin.com/in/lucio-freitas/">@lucio-freitas</a>
                        </div>             
                    </div> 
                    <div class="container-conteudo__item__mensagem">
                        <span>Agradecemos desde já sua colaboração!</span>  
                    </div>
                </div>
            </div>
        </div>

        <jsp:include page="/Components/footer.jsp"/>
        
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
                integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
                crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
                integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
                crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
                integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
                crossorigin="anonymous"></script>
    </body>
</html>