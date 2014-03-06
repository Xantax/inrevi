function preferred_code(preferred_code_sets, codes_attribute, value_set_map) {
  var codes_value = window[codes_attribute]();
  var _preferred_code_sets;

  if ( value_set_map ) {
    var _preferred_code_sets = $.map(value_set_map, function(value, key){ return value['set']; });
    _preferred_code_sets = $.map(preferred_code_sets, function(value){
      return $.inArray(value, _preferred_code_sets) < 0 ? null : value;
    });
  } else {
    _preferred_code_sets = preferred_code_sets;
  }

  var matching_code_sets = $.map( _preferred_code_sets, function(value){
    return $.inArray(value, keys(code_value)) < 0 ? null : value;
  });

  if ( matching_code_sets.length > 0) {
    if ( value_set_map ) {
      $.each(matching_code_sets, function(matching_code_set){
        matching_codes = codes_value[matching_code_set];
        
        var _t = $.map(value_set_map, function(cs){
          return cs['set'] == matching_code_sets ? cs['value'] : [];
        });
        _t = $.map(_t, function recurs(n) {
          return ($.isArray(n) ? $.map(n, recurs): n);
        });
        _t = $.grep(_t, function(n, i){
          return (n !== "" && n != null);
        });

        matching_codes = $.map(matching_codes, function(value){
          return $.isArray(value, _t) < 0 ? null : value;
        });

        if ( matching_codes.length > 0 ) {
          var _ret_arr = new Array();
          _ret_arr['code'] = matching_codes[0];
          _ret_arr['code_set'] = matching_code_sets;
          return _ret_arr;
        }

      });
    } else {
      var _ret_arr = new Array();
      var code_set = matching_code_sets[0];
      _ret_arr['code'] = codes_value[code_set][0];
      _ret_arr['code_set'] = code_set;
      return _ret_arr;
    }
  } else {
    return null;
  }

}

function keys(hashtable) {
  var keys = [];
  for (var k in hashtable) {
      if (hashtable.hasOwnProperty(k)) {
          keys.push(k);
      }
  }
  return keys;
}

function unique_data_criteria(measures) {
  var all_data_criteria_map = $.map(measures, function(measure){
    return measure.all_data_criteria;
  }); 
  all_data_criteria = $.grep(all_data_criteria_map, function(n, i){
    return (n !== "" && n != null);
  });
  var mapped_data_criteria = [];
  $.each(all_data_criteria, function(data_criteria){
    value_set_oid = data_criteria.code_list_id;

    // data_criteria_oid = HQMFTemplateHelper.template_id_by_definition_and_status(data_criteria.definition,(data_criteria.status || ""), criteria.negation)
    var dc, mapping;

    dc['data_criteria_oid'] = data_criteria_oid;
    dc['value_set_oid'] = value_set_oid;

    mapping = $.merge([], mapped_data_criteria['dc']);
    var t1 = new Array(), t2 = new Object();

    t1['result_oids'] = [];
    t2.data_criteria = data_criteria;

    $.merge(mapping, t1);
    $.merge(mapping, t2);
    mapping = $.unique(mapping);

    if (data_criteria.field_value) {
      $.each(keys(data_criteria.field_value), function(field){
        descr = data_criteria[field];
        if ( descr && descr.type == "CD") {
          $.merge(mapping['field_oids'][field], []);
          mapping['field_oids'][field] += descr.code_list_id;
        }
      });
    }

    if (data_criteria.value && data_criteria.value.type == "CD") {
      mapping['result_oids'] += data_criteria.value.code_list_id;
    }
  });
}

$(function(){
    $('div.ratting').raty({score:5});
});