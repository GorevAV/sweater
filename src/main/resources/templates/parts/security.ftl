<#assign
known = Session.SPRING_SECURITY_CONTEXT??
>

<#if known>
    <#assign
    user = Session.SPRING_SECURITY_CONTEXT.authentication.principal
    name = user.getUsername()
    isAdmin = user.isAdmin()
    currentUserID = user.getId()
    >
<#else>
    <#assign
    name = "unknown"
    isAdmin = false
    currentUserID = -1
    >
</#if>
