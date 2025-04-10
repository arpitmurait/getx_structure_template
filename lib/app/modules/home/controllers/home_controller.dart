import 'package:get/get.dart';

import '../../../data/repository/users_repository.dart' show UsersRepository;
import '/app/core/base/base_controller.dart';
import '/app/core/base/paging_controller.dart';
import '../../../data/model/users_response.dart';

class HomeController extends BaseController {
  final UsersRepository _repository = Get.find(
    tag: (UsersRepository).toString(),
  );

  final RxList<UserData> _userListController = RxList.empty();

  List<UserData> get userList => _userListController.toList();

  final pagingController = PagingController<UserData>();

  void getUserList() {
    if (!pagingController.canLoadNextPage()) return;

    pagingController.isLoadingPage = true;
    var body = {
      "page": pagingController.pageNumber,
      "limit": 10,
      "search_query": "",
    };

    var usersService = _repository.usersList(body);

    callDataService(usersService, onSuccess: _handleProjectListResponseSuccess);

    pagingController.isLoadingPage = false;
  }

  onRefreshPage() {
    pagingController.initRefresh();
    getUserList();
  }

  onLoadNextPage() {
    logger.i("On load next");

    getUserList();
  }

  void _handleProjectListResponseSuccess(UsersResponseModel response) {
    var users = response.data;

    if (_isLastPage(users!.length, response.totalCount!)) {
      pagingController.appendLastPage(users);
    } else {
      pagingController.appendPage(users);
    }

    var newList = [...pagingController.listItems];

    _userListController(newList);
  }

  bool _isLastPage(int newListItemCount, int totalCount) {
    return (userList.length + newListItemCount) >= totalCount;
  }
}
