<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page pageEncoding="utf-8" %>

</div> <!-- END #content -->

<footer>
  <div id="copyright" class="container">
    <p><spring:message code="copyright" /></p>
        <p>Powered by <a href="http://www.apereo.org/cas">
            Apereo Central Authentication Service <%=org.jasig.cas.CasVersion.getVersion()%></a>
            <%=org.jasig.cas.CasVersion.getDateTime()%></p>
  </div>
</footer>

</div> <!-- END #container -->


<script type="text/javascript" src="/jscas/jquery-ui.min.js"></script>
<script type="text/javascript" src="/jscas/jquery.cookie.js"></script>
<script type="text/javascript">
    $(function () {
        resourceLoadedSuccessfully();
    });
    function areCookiesEnabled() {
        $.cookie('cookiesEnabled', 'true');
        var value = $.cookie('cookiesEnabled');
        if (value != undefined) {
            $.removeCookie('cookiesEnabled');
            return true;
        }
        return false;
    }

    function resourceLoadedSuccessfully() {
        $(document).ready(function() {

            if ($(":focus").length === 0){
                $("input:visible:enabled:first").focus();
            }


            if (areCookiesEnabled()) {
                $('#cookiesDisabled').hide();
            } else {
                $('#cookiesDisabled').show();
                $('#cookiesDisabled').animate({ backgroundColor: 'rgb(187,0,0)' }, 30).animate({ backgroundColor: 'rgb(255,238,221)' }, 500);
            }

            //flash error box
            $('#msg.errors').animate({ backgroundColor: 'rgb(187,0,0)' }, 30).animate({ backgroundColor: 'rgb(255,238,221)' }, 500);

            //flash success box
            $('#msg.success').animate({ backgroundColor: 'rgb(51,204,0)' }, 30).animate({ backgroundColor: 'rgb(221,255,170)' }, 500);

            //flash confirm box
            $('#msg.question').animate({ backgroundColor: 'rgb(51,204,0)' }, 30).animate({ backgroundColor: 'rgb(221,255,170)' }, 500);

            $('#capslock-on').hide();
            $('#password').keypress(function(e) {
                var s = String.fromCharCode( e.which );
                if ( s.toUpperCase() === s && s.toLowerCase() !== s && !e.shiftKey ) {
                    $('#capslock-on').show();
                } else {
                    $('#capslock-on').hide();
                }
            });
            if (typeof(jqueryReady) == "function") {
                jqueryReady();
            }
        });

    };
</script>
<spring:theme code="cas.javascript.file" var="casJavascriptFile" text="" />
<script type="text/javascript" src="<c:url value="${casJavascriptFile}" />"></script>

</body>
</html>

