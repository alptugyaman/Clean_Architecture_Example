import 'package:mockito/annotations.dart';
import 'package:tokens/src/core/network/network_manager.dart';
import 'package:tokens/src/data/datasources/remote/remote_data_source.dart';
import 'package:tokens/src/domain/repositories/token_repository.dart';

@GenerateMocks([
  TokenRepository,
  RemoteDataSource,
], customMocks: [
  MockSpec<NetworkManager>(as: #MockNetworkManager)
])
void main() {}
