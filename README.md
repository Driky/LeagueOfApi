A library to facilitate access to the Riot API.

[![Build](https://github.com/Driky/LeagueOfApi/actions/workflows/ci.yaml/badge.svg)](https://github.com/Driky/LeagueOfApi/actions/workflows/ci.yaml)
[![codecov](https://codecov.io/gh/Driky/LeagueOfApi/branch/main/graph/badge.svg?token=NH7CT5NTM5)](https://codecov.io/gh/Driky/LeagueOfApi)

## Usage

```dart
import 'package:league_of_api/api/consts/region_routing_values.dart';
import 'package:league_of_api/api/models/riot_id.dart';
import 'package:league_of_api/api/models/tag_line.dart';
import 'package:league_of_api/league_of_api.dart';

void main() async {
  final leagueApi = LeagueOfApi('your_api_key');
  var account = await leagueApi.accountV1Service.getAccountByRiotId(
    RegionRoutingValue.AMERICAS,
    RiotId('Driky', TagLine('5441')),
  );
  print(account);
}
```

## Riot API key
Get your key [here](https://developer.riotgames.com/)

##Contribution
I appreciate any contributions to this package. Any not yet implemented endpoints can be added similarly to the other implementations. Feel free to reach out to me to ask any questions.

### Model code generation
The DTOs `fromJson` and `toJson` methods are generated with [json_serializable](https://pub.dev/packages/json_serializable).

Every time a model class annotated with `@JsonSerializable` is modified, you need to run the following command:

```
pub run build_runner build --delete-conflicting-outputs
```

Note: You can remove the `--delete-conflicting-outputs` if you are the last person who ran this command (faster execution by using a local cache)

Note 2: The plugin [AutoJson](https://plugins.jetbrains.com/plugin/11600-autojson) for Android Studio/IntelliJ provides a handy shortcut for that command.
