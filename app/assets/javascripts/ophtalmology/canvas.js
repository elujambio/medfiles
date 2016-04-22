// $("canvas").each(
//       function () {
//             $(this).css("width", "100%");
//             $(this).css("height", "100%");
//             $(this).width("100%");
//             $(this).height("100%");
//             // $(this).width  = $(this).offsetWidth;
//             // $(this).height = $(this).offsetHeight;
            
//       }
// );
      var gl = document.getElementById('goinoscopy-left');
      var gr = document.getElementById('goinoscopy-right');
      var ml = document.getElementById('macula-left');
      var mr = document.getElementById('macula-right');
      fitToContainer(gl);
      fitToContainer(gr);
      fitToContainer(ml);
      fitToContainer(mr);

      function fitToContainer(canvas){
        // Make it visually fill the positioned parent
        canvas.style.width ='100%';
        canvas.style.height='100%';
        // ...then set the internal size to match
        canvas.width  = canvas.offsetWidth;
        canvas.height = canvas.offsetHeight;
      }
      function startCanvas() {

      // $('#goinoscopy-left').css("width", $(this).parent().css("width"));
      // $('#goinoscopy-right').css("width", $(this).parent().css("width"));
            $('#goinoscopy-right').sketch();
            $('#goinoscopy-left').sketch();
            $('#macula-right').sketch();
            $('#macula-left').sketch();
      };
      startCanvas();
      function clearCanvas(canvas){
            var context = canvas.getContext("2d");
            context.clearRect(0, 0, canvas.width, canvas.height);
            $(canvas).sketch('actions',[]);
            // $(canvas).sketch('actions',[]);
            console.log("canvas clear");
      }
      $(document).ready(
        function () { 
          $("#clear-gl").click(
            function(){
              console.log("button click");
              clearCanvas(gl);
            }
          );
        }
      );