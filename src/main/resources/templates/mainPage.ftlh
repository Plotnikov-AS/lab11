<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Lab 11</title>
    <link rel="stylesheet" type="text/css" href="/jquery/jquery-ui.css">
    <script src="/jquery/jquery-3.4.1.min.js"></script>
    <script src="/jquery/jquery-ui.min.js"></script>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
<div id="mainDiv">
    <table border="1px">
        <tr>
            <td>F1 = sqrt(x)</td>
            <td>F2 = 1/x</td>
            <td>F3 = e^x</td>
        </tr>
    </table>
    <br>
    <div id="equation">
        <div class="cell">y =</div>
        <div class="cell dragElement" id="func">F1</div>
        <div class="cell">(</div>
        <div class="cell dragElement" id="func">F2</div>
        <div class="cell">(</div>
        <div class="cell dragElement" id="func">F3</div>
        <div class="cell">(x)))</div>
        <div class="cell">
            <form method="post" action="/calc">
                <input type="hidden" id="first" name="first">
                <input type="hidden" id="second" name="second">
                <input type="hidden" id="third" name="third">
                <input type="submit" value="Сгенерировать" onclick="getEquation()">
            </form>
        </div>
        <script>
            function getEquation() {
                let first = document.getElementById("first");
                let second = document.getElementById("second");
                let third = document.getElementById("third");

                first.value = document.getElementById("equation").getElementsByTagName("div")[5].innerHTML;
                second.value = document.getElementById("equation").getElementsByTagName("div")[3].innerHTML;
                third.value = document.getElementById("equation").getElementsByTagName("div")[1].innerHTML;

                console.log(first);
                console.log(second);
                console.log(third);

            }
        </script>
        <script>
            var $start, $stop;
            var $change;
            jQuery.fn.swap = function (b) {
                // method from: http://blog.pengoworks.com/index.cfm/2008/9/24/A-quick-and-dirty-swap-method-for-jQuery
                b = jQuery(b)[0];
                var a = this[0];
                var t = a.parentNode.insertBefore(document.createTextNode(''), a);
                b.parentNode.insertBefore(a, b);
                t.parentNode.insertBefore(b, t);
                t.parentNode.removeChild(t);
                return this;
            };
            $(function () {
                $('.dragElement').draggable({
                    axis: "x",
                    containment: "parent",
                    revert: true,
                    revertDuration: 1,
                    start: function () {
                        $(this).css("z-index", "20");
                        $change = 0;

                    },
                    stop: function () {
                        $(this).css("z-index", "0");
                        //$(this).revert();
                        $('.dragElement').css("background-color", "");
                    }
                });
                $('.dragElement').droppable({
                    drop: function (event, ui) {
                        //$('.dragElement').draggable( "option", "revert", false );
                        var draggable = ui.draggable, droppable = $(this),
                            dragPos = draggable.position(), dropPos = droppable.position();

                        //alert($(':input[value="F1"]')[0].value);
                        $drag_f = draggable.text();
                        $drop_f = droppable.text();
                        $drag_inp = $(':input[value="' + $drag_f + '"]')[0];
                        $drop_inp = $(':input[value="' + $drop_f + '"]')[0];
                        $($drag_inp).val($drop_f);
                        $($drop_inp).val($drag_f);

                        draggable.css({
                            left: dropPos.left + 'px',
                            //top: dropPos.top+'px'
                        });

                        droppable.css({
                            //left: dragPos.left+'px',
                            //top: dragPos.top+'px'
                        });
                        draggable.swap(droppable);


                        //alert($(this).text())
                    },
                    over: function () {
                        $('.dragElement').css({
                            backgroundColor: "#DDDDDD"
                        });
                    },
                    out: function () {
                        $('.dragElement').css("background-color", "");
                    }
                });
            });
        </script>
    </div>
    <div id="equation">
        <#if (equation)??>
            ${equation}
        </#if>
    </div>
</div>
</body>
</html>