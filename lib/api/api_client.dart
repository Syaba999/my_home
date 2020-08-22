import 'package:graphql/client.dart';

import 'urls.dart';

class ApiClient {
  final GraphQLClient client;

  ApiClient(this.client);

  factory ApiClient.init() {
    HttpLink _httpLink = HttpLink(
      uri: apiUrl,
    );

    AuthLink _authLink = AuthLink(
      getToken: () async => '',
    );

    Link _link = _authLink.concat(_httpLink);

    GraphQLClient _client = GraphQLClient(
      cache: InMemoryCache(),
      link: _link,
    );

    return ApiClient(_client);
  }
}
