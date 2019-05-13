// TODO: send fields from options page as well
// TODO: error detection everywhere

// Main Triggered Function
function onEdit(e) {
  re = new RegExp("^Game", "i");
  if(e.range.getSheet().getName().match(re)) {
    var game_sheet = e.getSheet();
    var game_number = getGameFromRange(e.range);
    updateServer(game_sheet, game_number);
  }
}

// Updates a game object on the backend from a sheet, game_number
function updateServer(game_sheet, game_number) {
  var options_sheet = SpreadsheetApp.getActiveSpreadsheet().getSheetByName("Options");
  var host = options_sheet.getRange("B15").getValue();
  var secret = options_sheet.getRange("B16").getValue();

  // Find Game ID from Match ID and game_number
  var match_id = game_sheet.getRange("A1").getValue();
  var url = host + '/matches/' + match_id + '.json';
  var resp = UrlFetchApp.fetch(url);
  var game_id = getGameIDFromMatch(resp.getContentText(), game_number);

  // Post update to game
  url = host + '/games/' + game_id;

  var data = {
    'yellow_team': getTeamsForGame(game_sheet, game_number)[0],
    'black_team': getTeamsForGame(game_sheet, game_number)[1],
    'frames': getFramesForGame(game_sheet, game_number)
  };

  var options = {
    'method': 'put',
    'contentType': 'application/json',
    'muteHttpExceptions': true,
    'headers': { 'live-secret': secret },
    'payload': JSON.stringify(data)
  };

  resp = UrlFetchApp.fetch(url, options);
  options_sheet.getRange("B19").setValue(new Date().toISOString())
  options_sheet.getRange("B20").setValue(resp.getResponseCode());
  options_sheet.getRange("B21").setValue(resp.getContentText());
}

// Return Game ID for match_json, game_number
function getGameIDFromMatch(match_json, game_number) {
  var game = findObjectByKey(JSON.parse(match_json).games, 'number', game_number);

  if(game) {
    return game.id;
  }
  return null;
}

// Returns [yellow_team, black_team] for sheet, game_number
function getTeamsForGame(game_sheet, game_number) {
  if(game_number == 1) {
    return [
      game_sheet.getRange("B2").getValue(),
      game_sheet.getRange("D2").getValue()
    ];
  } else if (game_number == 2) {
    return [
      game_sheet.getRange("H2").getValue(),
      game_sheet.getRange("J2").getValue()
    ];
  } else if (game_number == 3) {
    return [
      game_sheet.getRange("N2").getValue(),
      game_sheet.getRange("P2").getValue()
    ];
  }
  return ["", ""];
}

// Returns double array of frames for sheet, game_number
// This include blanks (including merged cells)
function getFramesForGame(game_sheet, game_number) {
  if(game_number == 1) {
    return game_sheet.getRange("C3:D33").getValues();
  } else if (game_number == 2) {
    return game_sheet.getRange("I3:J33").getValues();
  } else if (game_number == 3) {
    return game_sheet.getRange("O3:P33").getValues();
  }
  return [];
}

function getGameFromRange(range) {
  var column = range.getColumn();
  if(column >=2 && column <=5) {
    return 1;
  } else if(column >= 8 && column <= 11) {
    return 2;
  } else if(column >= 14 && column <= 17) {
    return 3;
  }

  return null;
}

////////////////////
// Helper Functions
////////////////////

function findObjectByKey(array, key, value) {
  for (var i = 0; i < array.length; i++) {
    if (array[i][key] === value) {
      return array[i];
    }
  }
  return null;
}

function testUpdateServer() {
  var game_sheet = SpreadsheetApp.getActiveSpreadsheet().getSheetByName("Game - Semi 1");
  var game_number = 1;
  updateServer(game_sheet, game_number);
}
