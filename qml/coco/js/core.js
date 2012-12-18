.pragma library

var _db;

function openDB() {
    _db = openDatabaseSync("CoCoDB","1.0","Coco's database",1000000);
    createTables();
}

function createTables() {
    _db.transaction(
                function(tx){
                    tx.executeSql("CREATE TABLE IF NOT EXISTS players \
                        (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT NOT NULL, imagepath TEXT)");
                    tx.executeSql("CREATE TABLE IF NOT EXISTS games \
                        (id INTEGER PRIMARY KEY AUTOINCREMENT, startdate TEXT, enddate TEXT)");
                    tx.executeSql("CREATE TABLE IF NOT EXISTS rounds \
                        (gameid INTEGER NOT NULL, playerid INTEGER NOT NULL, \
                        round INTEGER NOT NULL, points INTEGER NOT NULL, \
                        FOREIGN KEY(gameid) REFERENCES games (id) ON DELETE CASCADE, \
                        FOREIGN KEY(playerid) REFERENCES players (id) ON DELETE CASCADE, \
                        UNIQUE (gameid, playerid, round))");

                }
                )
}

function dropTables() {
    _db.transaction(
                function(tx){
                    tx.executeSql("DROP TABLE IF EXISTS players");
                    tx.executeSql("DROP TABLE IF EXISTS games");
                    tx.executeSql("DROP TABLE IF EXISTS rounds");
        }
   )
}

function addPlayer(name, imagepath) {
    _db.transaction(
                function(tx){
                    tx.executeSql("INSERT INTO players (name, imagepath) VALUES(?, ?)", [name, imagepath]);
                }
                )
}

function readPlayers() {
    var data = [];
    _db.readTransaction(
                function(tx){
                    var rs= tx.executeSql("SELECT * FROM players ORDER BY name");
                    for (var i=0; i < rs.rows.length; i++) {
                        data[i] = rs.rows.item(i);
                    }
                }
                )
    return data;
}
