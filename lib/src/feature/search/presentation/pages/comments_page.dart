import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:city_drive/src/core/theme/resources.dart';
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

  @override
  void dispose() {
    _commentController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  Future<void> _addComment() async {
    if (_commentController.text.trim().isEmpty) return;

    final newComment = Comment(
      author: 'Вы',
      text: _commentController.text.trim(),
      time: DateTime.now(),
    );

    final updatedComments = [...?widget.problem.comments, newComment];

    final updatedProblem = RoadProblemDTO(
      id: widget.problem.id,
      authorUserId: widget.problem.authorUserId,
      assignedControllerId: widget.problem.assignedControllerId,
      title: widget.problem.title,
      description: widget.problem.description,
      address: widget.problem.address,
      latitude: widget.problem.latitude,
      longitude: widget.problem.longitude,
      type: widget.problem.type,
      severity: widget.problem.severity,
      status: widget.problem.status,
      reportedDate: widget.problem.reportedDate,
      images: widget.problem.images,
      author: widget.problem.author,
      likes: widget.problem.likes,
      commentsCount: updatedComments.length,
      comments: updatedComments,
    );

   
    await context.read<RoadProblemsProvider>().updateProblem(updatedProblem);

   
    _commentController.clear();
    _focusNode.unfocus();

   
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Комментарий добавлен'),
        backgroundColor: Colors.green,
        duration: Duration(seconds: 1),
      ),
    );

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
   
    final currentProblem = context
            .watch<RoadProblemsProvider>()
            .getProblemById(widget.problem.id) ??
        widget.problem;

    final comments = currentProblem.comments ?? [];

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text('Комментарии (${comments.length})'),
        backgroundColor: AppColors.white,
        foregroundColor: AppColors.blac151619,
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        children: [
          
          Expanded(
            child: comments.isEmpty
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
                          'Будьте первым, кто оставит комментарий!',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[500],
                          ),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: comments.length,
                    itemBuilder: (context, index) {
                      final comment = comments[index];
                      return _CommentItem(
                        comment: comment,
                        isCurrentUser: comment.author == 'Вы',
                      );
                    },
                  ),
          ),

         
          Container(
            decoration: BoxDecoration(
              color: AppColors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
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
                        hintText: 'Добавить комментарий...',
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
                    decoration: BoxDecoration(
                      color: AppColors.mainColor,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      onPressed: _addComment,
                      icon: const Icon(
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
  final Comment comment;
  final bool isCurrentUser;

  const _CommentItem({
    required this.comment,
    required this.isCurrentUser,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Аватар
          CircleAvatar(
            radius: 20,
            backgroundColor: isCurrentUser
                ? AppColors.mainColor.withOpacity(0.2)
                : Colors.grey[300],
            child: Text(
              comment.author[0].toUpperCase(),
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: isCurrentUser ? AppColors.mainColor : Colors.grey[700],
              ),
            ),
          ),
          const Gap(12),

          // Контент комментария
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isCurrentUser
                    ? AppColors.mainColor.withOpacity(0.1)
                    : Colors.grey[100],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Имя и время
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        comment.author,
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

                  // Текст комментария
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