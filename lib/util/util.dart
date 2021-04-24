String enumToString(val) => val == null
    ? ''
    : val.toString().substring(val.toString().indexOf('.') + 1);
