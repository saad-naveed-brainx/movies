import 'package:flutter/material.dart';
import 'package:movies/models/movie_model.dart';
import 'package:movies/core/constants/app_constants.dart';
import 'package:movies/config/theme/dark.dart';
import 'package:movies/core/constants/view_constants.dart';

class MovieTile extends StatelessWidget {
  final MovieModel movie;

  const MovieTile({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppConstants.gap16Px),
      child: Card(
        elevation: AppConstants.gap10Px,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConstants.font16Px),
        ),
        color: Dark.cardColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(AppConstants.font16Px),
              ),
              child: Image.network(
                movie.image,
                height: 400,
                width: double.infinity,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Container(
                    height: 400,
                    color: Dark.cardColor,
                    child: Center(
                      child: CircularProgressIndicator(color: Dark.starColor),
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 400,
                    color: Dark.cardColor,
                    child: Center(
                      child: Icon(
                        Icons.error_outline,
                        color: Colors.red,
                        size: AppConstants.gap4Px * 2,
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(AppConstants.gap16Px),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: AppConstants.gap12Px,
                          vertical: AppConstants.gap6Px,
                        ),
                        decoration: BoxDecoration(
                          color: Dark.starColor.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(
                            AppConstants.font20Px,
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Dark.starColor,
                              size: AppConstants.font24Px,
                            ),
                            SizedBox(width: AppConstants.gap4Px),
                            Text(
                              '${movie.rating} ${ViewConstants.backSlashText}',
                              style: TextStyle(
                                color: Dark.starColor,
                                fontWeight: FontWeight.bold,
                                fontSize: AppConstants.font16Px,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: AppConstants.gap12Px,
                          vertical: AppConstants.gap6Px,
                        ),
                        decoration: BoxDecoration(
                          color: Dark.textColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(
                            AppConstants.font20Px,
                          ),
                        ),
                        child: Text(
                          movie.year.toString(),
                          style: TextStyle(
                            color: Dark.textColor,
                            fontWeight: FontWeight.w500,
                            fontSize: AppConstants.font16Px,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: AppConstants.gap16Px),
                  Text(
                    movie.title,
                    style: TextStyle(
                      fontSize: AppConstants.font24Px,
                      fontWeight: FontWeight.bold,
                      color: Dark.textColor,
                      height: 1.2,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
