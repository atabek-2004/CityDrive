import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:city_drive/src/core/theme/resources.dart';
import 'package:city_drive/src/core/utils/extensions/context_extension.dart';
import 'package:city_drive/src/core/local_storage/report_status.dart';
import 'package:city_drive/src/feature/search/bloc/road_problems_provider.dart';
import 'package:city_drive/src/feature/search/model/road_problem_dto.dart';
import 'package:intl/intl.dart';

@RoutePage()
class CommentsPage extends StatefulWidget {
  final RoadProblemDTO problem;

  const CommentsPage({
    super.key,
    required this.problem,
  });

  @override
  State<CommentsPage> createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {
  final TextEditingController _commentController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  List<Comment> _comments = [];
  bool _loading = true;
  bool _sending = false;
  String? _loadError;

  @override
  void initState() {
    super.initState();
    _loadComments();
  }

  @override
  void dispose() {
    _commentController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  Future<void> _loadComments() async {
    setState(() {
      _loading = true;
      _loadError = null;
    });
    try {
      final items = await context
          .read<RoadProblemsProvider>()
          .fetchComments(widget.problem.id);
      if (!mounted) return;
      setState(() {
        _comments = items;
        _loading = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _loadError = e.toString();
        _loading = false;
      });
    }
  }

  Future<void> _addComment() async {
    final text = _commentController.text.trim();
    if (text.isEmpty || _sending) return;

    final l10n = context.localized;
    if (!context.repository.authRepository.isAuthenticated) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.cityDriveLoginToPublish)),
      );
      return;
    }

    final problem = context.read<RoadProblemsProvider>().getProblemById(
          widget.problem.id,
        ) ??
        widget.problem;
    final blocked = ReportStatus.engageBlockedReasonRu(problem.status);
    if (blocked != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(blocked)),
      );
      return;
    }

    setState(() => _sending = true);
    try {
      final created = await context
          .read<RoadProblemsProvider>()
          .addComment(widget.problem.id, text);
      if (!mounted) return;
      setState(() {
        _comments = [..._comments, created];
      });
      _commentController.clear();
      _focusNode.unfocus();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Комментарий добавлен'),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 1),
        ),
      );
    } on DioException catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message ?? e.toString())),
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    } finally {
      if (mounted) setState(() => _sending = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.localized;
    final currentUserId = context.repository.authRepository.user?.id;
    final totalCount = context
            .watch<RoadProblemsProvider>()
            .getProblemById(widget.problem.id)
            ?.commentsCount ??
        _comments.length;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text('${l10n.cityDriveComments} ($totalCount)'),
        backgroundColor: AppColors.white,
        foregroundColor: AppColors.blac151619,
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: _loading
                ? const Center(child: CircularProgressIndicator())
                : _loadError != null
                    ? Center(
                        child: Padding(
                          padding: const EdgeInsets.all(24),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                _loadError!,
                                textAlign: TextAlign.center,
                                style: const TextStyle(color: Colors.red),
                              ),
                              const Gap(16),
                              ElevatedButton(
                                onPressed: _loadComments,
                                child: const Text('Повторить'),
                              ),
                            ],
                          ),
                        ),
                      )
                    : _comments.isEmpty
                        ? Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.chat_bubble_outline,
                                  size: 64,
                                  color: Colors.grey[400],
                                ),
                                const Gap(16),
                                Text(
                                  'Пока нет комментариев',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey[600],
                                  ),
                                ),
                                const Gap(8),
                                Text(
                                  l10n.cityDriveLeaveFirstComment,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey[500],
                                  ),
                                ),
                              ],
                            ),
                          )
                        : RefreshIndicator(
                            onRefresh: _loadComments,
                            child: ListView.builder(
                              physics: const AlwaysScrollableScrollPhysics(),
                              padding: const EdgeInsets.all(16),
                              itemCount: _comments.length,
                              itemBuilder: (context, index) {
                                final comment = _comments[index];
                                final isCurrentUser =
                                    comment.authorUserId != null &&
                                        comment.authorUserId == currentUserId;
                                return _CommentItem(
                                  comment: comment,
                                  isCurrentUser: isCurrentUser,
                                );
                              },
                            ),
                          ),
          ),
          Container(
            decoration: BoxDecoration(
              color: AppColors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 10,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            padding: EdgeInsets.only(
              left: 16,
              right: 16,
              top: 12,
              bottom: MediaQuery.of(context).viewInsets.bottom + 12,
            ),
            child: SafeArea(
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _commentController,
                      focusNode: _focusNode,
                      maxLines: null,
                      textCapitalization: TextCapitalization.sentences,
                      decoration: InputDecoration(
                        hintText: l10n.cityDriveAddCommentHint,
                        hintStyle: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 14,
                        ),
                        filled: true,
                        fillColor: Colors.grey[100],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 10,
                        ),
                      ),
                    ),
                  ),
                  const Gap(8),
                  Container(
                    decoration: const BoxDecoration(
                      color: AppColors.mainColor,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      onPressed: _sending ? null : _addComment,
                      icon: _sending
                          ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.white,
                              ),
                            )
                          : const Icon(
                              Icons.send_rounded,
                              color: Colors.white,
                              size: 20,
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CommentItem extends StatelessWidget {
  const _CommentItem({
    required this.comment,
    required this.isCurrentUser,
  });

  final Comment comment;
  final bool isCurrentUser;

  @override
  Widget build(BuildContext context) {
    final authorLabel = comment.author.isNotEmpty ? comment.author : 'User';
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: isCurrentUser
                ? AppColors.mainColor.withValues(alpha: 0.2)
                : Colors.grey[300],
            child: Text(
              authorLabel[0].toUpperCase(),
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: isCurrentUser ? AppColors.mainColor : Colors.grey[700],
              ),
            ),
          ),
          const Gap(12),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isCurrentUser
                    ? AppColors.mainColor.withValues(alpha: 0.1)
                    : Colors.grey[100],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        authorLabel,
                        style: AppTextStyles.body14w400.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        _formatCommentTime(comment.time),
                        style: AppTextStyles.body12W400.copyWith(
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                  const Gap(6),
                  Text(
                    comment.text,
                    style: AppTextStyles.body14w400.copyWith(
                      color: Colors.grey[800],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _formatCommentTime(DateTime time) {
    final now = DateTime.now();
    final difference = now.difference(time);

    if (difference.inSeconds < 60) {
      return 'только что';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes} мин назад';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} ${_hourWord(difference.inHours)} назад';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} ${_dayWord(difference.inDays)} назад';
    } else {
      return DateFormat('dd.MM.yyyy').format(time);
    }
  }

  String _hourWord(int hours) {
    if (hours == 1) return 'час';
    if (hours >= 2 && hours <= 4) return 'часа';
    return 'часов';
  }

  String _dayWord(int days) {
    if (days == 1) return 'день';
    if (days >= 2 && days <= 4) return 'дня';
    return 'дней';
  }
}
