<div class="session-container">
    <div class="session-item">
        <label id="label-nome" for="session-nome">Usuário:</label>
        <span id="session-nome"><%= session.getAttribute("nome") %></span>
    </div>
    <div class="session-button">
        <a id="sair-button" class="session-button__caixa session-button--efeito"
           href="${pageContext.request.contextPath}/Logout">
            <span class="session-button__caixa__titulo">Sair</span>
        </a>
    </div>
</div>