# esx_license
FXServer ESX License

[UPDATE]
insert licences to items 

```
INSERT INTO `items` (`name`, `label`, `limit`, `rare`, `can_remove`) VALUES
('dmv', 'Code de la route', 1, 0, 0),
('drive', 'Permis de conduire', 1, 0, 0),
('drive_bike', 'Permis moto', 1, 0, 0),
('drive_truck', 'Permis camion', 1, 0, 0),
('weapon', 'Permis d\'arme', 1, 0, 0);
```

[INSTALLATION]

1) Using [fvm](https://github.com/qlaffont/fvm-installer)
```
fvm install --save --folder=esx esx-org/esx_license

```

2) Manually

- Download https://github.com/ESX-Org/esx_license/releases/latest
- Put it in [esx] directory


1) Import esx_license.sql in your database
2) Add this in your server.cfg :

```
start esx_license
```
