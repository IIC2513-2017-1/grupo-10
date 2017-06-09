// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

function genGrid(total, bought) {
    var numbers = []
    for (n = 1; n <= total; n++) {
        if (bought.indexOf(n) === -1) {
            value = 0 // 0 => green => Libre
        } else {
            value = 2 // 2 => red => Ocupado            
        }
        numbers.push({
            number: n,
            value: value,
        })
    }
    d3.select('#main')
        .attr('height', ~~(total / 10) * 24 - 4)
        .attr('width', 10 * 24 - 4)
    var rect_gs = d3.select('#main').selectAll('g').data(numbers)
    var color = d3.scaleQuantile().domain([0, 1, 2])
                    .range([
                        "green", "yellow", "red"
                        ])
    rect_gs.enter().append('g')
        .attr('height', 20)
        .attr('width', 20)
        .on('mouseover', function(d) {
            if (d.value !== 2) { 
                d3.select(this).style("cursor", "pointer")
            }            
            d3.select(this).selectAll('text').style("display", null)
            d3.select(this).selectAll('text').text(function(d) { return d.number })
            if (d.value === 0) {
                console.log("Libre")
            } else if (d.value === 1) {
                console.log("Selected")
            } else if (d.value === 2) {
                console.log("Vendido")
            }
        })
        .on('mouseout', function(d) {
            d3.select(this).style("cursor", null)
            d3.select(this).selectAll('text').style("display", "none")
        })
        .on('click', function(d) {
            if (d.value === 0) { d.value = 1 } 
            else if (d.value === 1) { d.value = 0 } 
            else { return }
            $("#buy #numbers_" + d.number).prop('checked', d.value)
            d3.select(this).selectAll('rect').attr('fill', function(d) { return color(d.value) })
        })     
    d3.select('#main').selectAll('g').append('rect')
        .attr('y', function(_, i) { return ~~(i / 10) * 24 })
        .attr('x', function(_, i) { return (i % 10) * 24 })
        .attr('fill', function(d) { return color(d.value) })
        .attr('height', 20)
        .attr('width', 20)
    d3.select('#main').selectAll('g').append('text')
        .attr('y', function(_, i) { return ~~(i / 10) * 24 })
        .attr('x', function(_, i) { return (i % 10) * 24 })
        .attr('fill', "white")
        .attr("dy", '16px')
        .attr('dx', '4px')        
        .style("font-size", "13px")
        .style("user-select", "none")  
}

function getRaffle(id) {
    if (id == null) {
        return 
    }
    $.ajax({
        type: "GET",
        dataType: "json",
        url: "/raffles/" + id,
        success: function(json) {
            bought = json.numbers.map(function(n) {
                return n.number_in_raffle
            })
            total = json.number_amount
            genGrid(total, bought)
        }
    })
}

$(document).on('turbolinks:load', function(){
    var dataId = $('#main').data('params-id');
    getRaffle(dataId)
});
