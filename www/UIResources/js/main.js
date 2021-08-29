(function ($) {

    "use strict";

$(document).ready(function(){
    $('#select').select2();

    $('.arrow').on('click',function(){
        let children = $(this).parent().parent().children('.sub-menu').toggle('showMenu')
    })

    $('#label').on('click',function(){
        let sidebar = document.querySelector(".sidebar")
        if ($('input[id=sidebar-toggle]').is(':checked')) {
            $('.sidebar').removeClass('closes')
        }else{
            sidebar.classList.toggle("closes")
            /*$('.sidebar').addClass('closes')*/
        }
        
        
    })

    $(".dropbtn").on('click',function(e){
        if ($(this).next().hasClass("show")) {
            $(this).next().removeClass('show')
        }else{
            $(this).next().addClass('show')
        }
        
    })

  window.onload = function() {

    

    $('.sidebar-menu li').on('click','a',function(e){
        
        if ($(this).parent().children('ul').length) {
            e.preventDefault();
            $(this).parent().addClass('active')
            $(this).addClass('active')
            $(this).parent().children('ul').slideDown()
            
        }
    })

    $('.sidebar-menu li').on('click','a .active',function(e){
        e.preventDefault();
        $(this).removeClass('active')
        $(this).parent().removeClass('active')
        $(this).parent().children('ul').slideUp()
    })

    var ctx = document.getElementById('myChart');
    var myChart = new Chart(ctx, {
    type: 'bar',
    data: {
        //labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
        labels: ['Janvier', 'Février', 'Mars', 'Avril', 'Juin', 'Juillet','Août','Septembre','Octobre','Novembre','Décembre'],
        datasets: [{
            label: 'Opérations',
            data: [50,12, 19, 3, 5, 2, 3, 0],
            fill: true,
            tension:1,
            backgroundColor: [
                '#00A8F3'
            ],
            borderColor: [
                '#00A8F3'
            ],
            borderWidth: 2,
            borderRadius:10,
            maxBarThickness:8,
        }]
    },
    options: {
        responsive:true,
        scales: {
            yAxes: [{
                ticks:{
                    beginAtZero: true
                }
                
            }]
        },
        //aspectRatio:1
    }
});

const data = {
    labels: [
      'Red',
      'Forfait',
      'Mobile money'
    ],
    datasets: [{
      label: 'My First Dataset',
      data: [300, 50, 100],
      backgroundColor: [
        'rgb(255, 99, 132)',
        'rgb(54, 162, 235)',
        'rgb(255, 205, 86)'
      ],
      hoverOffset: 4
    }]
  };

var ctx = document.getElementById('myChart2');
    var myChart2 = new Chart(ctx, {
    type: 'doughnut',
    data: data,
    options:{
        responsive:true,
    }
});
  }

    var datatable = $('#table').DataTable({
        "pageLength": 6,
        "language":{
            paginate:{
                "first":"Premier",
                "last":"Dernier",
                "next":"Suivant",
                "previous":"Antérieur"
            }
        },
        'aoColumnDefs':[
            {
                'bSortable':true,
                'aTargets':['nosort'],
            }
        ],
       // columnDefs:[
         //   {type:'date-dd-mm-yyyy',aTargets:[5]}
       // ],
        /*"aoColumns":[
            null,
            null,
            null,
            null,
            null,
            null,
            null
        ],*/
        "order":true,
        "bLengthChange": true,
        "dom":'<"top">ct<"top"p><"clear">'
    });

    $('#filter').on('keyup',function(){
        datatable.search(this.value).draw();
    });
    
})
})(window.jQuery);

