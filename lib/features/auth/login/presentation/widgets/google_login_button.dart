import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GoogleLoginButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final bool isLoading;

  const GoogleLoginButton({
    super.key,
    this.onPressed,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: isLoading ? null : onPressed,
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 12),
        side: BorderSide(color: Theme.of(context).colorScheme.outline),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        backgroundColor: Theme.of(context).colorScheme.surface,
        disabledBackgroundColor:
            Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.05),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (isLoading)
            SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(
                    Theme.of(context).colorScheme.onSurfaceVariant),
              ),
            )
          else
            SvgPicture.asset(
              'assets/icons/google.svg',
              height: 24,
              width: 24,
            ),
          const SizedBox(width: 12),
          Text(
            isLoading ? 'Mohon tunggu...' : 'Masuk dengan Google',
            style: TextStyle(
              color: isLoading
                  ? Theme.of(context).colorScheme.onSurfaceVariant
                  : Theme.of(context).colorScheme.onSurface,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
