<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>FinanceApp - Contato</title>
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
        
        <div class="containerPrincipal">
            <div class="containerSuporte">
                <div class="subTitulo">
                    <a>Dúvidas? Contate-nos!</a>  
                </div>
                <div class="containerConteudo" >
                    <div class="itemConteudo">
                        <div class="itemGustavo">
                            <div class="divNome">
                                <label for="nomeGustavo">Nome:</label>
                                <span id="nomeGustavo">Gustavo F. Vetter</span>
                            </div>
                            <div class="divEmail">
                                <label for="emailGustavo">Email:</label>
                                <a id="emailGustavo" href="mailto:vetter.gustavo@gmail.com">vetter.gustavo@gmail.com</a>
                            </div>
                            <div class="divRedeSocial">
                                <label for="redeSocialGustavo">Linkedin:</label>
                                <a id="redeSocialGustavo" href="https://www.linkedin.com/in/gustavo-f-vetter-012090225/">@gustavo-f-vetter-012090225</a>
                            </div>
                        </div>
                    </div> 
                    <div class="itemConteudo">
                        <div class="itemHector">
                            <div class="divNome">
                                <label for="nome">Nome:</label>
                                <a>Héctor Júlio Martins de França</a>
                            </div>
                            <div class="divEmail">
                                <label for="email">Email:</label>
                                <a href="mailto:hectorjuliomartinsdefranca@hotmail.com">hectorjuliomartinsdefranca@hotmail.com</a>
                            </div>
                            <div class="divRedeSocial">
                                <label for="redeSocial">Linkedin:</label>
                                <a href="https://www.linkedin.com/in/hectorfranca/">@hectorfranca</a>
                            </div>
                        </div>
                    </div> 
                    <div class="itemConteudo">
                        <div class="itemLucio">
                            <div class="divNome">
                                <label for="nome">Nome:</label>
                                <a>Lúcio de Freitas Pereira</a>
                            </div>
                            <div class="divEmail">
                                <label for="email">Email:</label>
                                <a href="mailto:luciodfp@gmail.com">luciodfp@gmail.com</a>
                            </div>
                            <div class="divRedeSocial">
                                <label for="redeSocial">Linkedin:</label>
                                <a href="https://www.linkedin.com/in/lucio-freitas/">@lucio-freitas</a>

                            </div>
                        </div>
                    </div> 
                    <div class="tituloRodape">
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