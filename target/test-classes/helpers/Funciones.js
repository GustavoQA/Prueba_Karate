function fechaValida(s) {
    var SimpleDateFormat = Java.type("java.text.SimpleDateFormat");
    var sdf = new SimpleDateFormat("dd-MM-yyyy");
    karate.log('fecha antes',s);
    try {
      sdf.parse(s).time;
      karate.log(sdf.parse(s).time);
      return true;
    } catch(e) {
      karate.log('*** invalid date string:', s);
      return false;
    }
  }