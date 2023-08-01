import 'package:flutter/material.dart';
import 'package:fluttershow_base/components/model/enum/code_display_themes.dart';
import 'package:fluttershow_base/components/widgets/spacing/paddings.dart';
import 'package:fluttershow_base/components/widgets/wrapper/code_display.dart';

class Code extends StatelessWidget {
  const Code({super.key});

  @override
  Widget build(BuildContext context) {
    return CodeDisplay(
      """
// Comment
     class _DartCodeViewerPage extends StatelessWidget {
const _DartCodeViewerPage(this.code);
          final InlineSpan code;

    @override
          Widget build(BuildContext context) {
       final _richTextCode = code;
final _plainTextCode = _richTextCode.toPlainText();
    
       void _showSnackBarOnCopyFailure(Object exception) {ScaffoldMessenger.of(context).showSnackBar( SnackBar(
            
            
            
              content: Text('Failure to copy to clipboard: exception'),
  ),
          );
  }
    
  return Column(
     crossAxisAlignment: CrossAxisAlignment.start,
              children: [
      if (DartCodeViewerTheme.of(context).showCopyButton!)
        ElevatedButton(
          onPressed: () async {
   await Clipboard.setData(ClipboardData(text: _plainTextCode)) .then(_showSnackBarOnCopySuccess)
                .catchError(_showSnackBarOnCopyFailure);
          },
                child: DartCodeViewerTheme.of(context).copyButtonText,
        ),
            ],
  );
  }
  }
""",
      width: 650,
      height: 700,
      codeColorTheme: CodeDisplayColorThemes.cobalt,
      classTextStyle: const TextStyle(color: Colors.lightBlue),
      padding: allPadding16,
      boxDecoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
    );
  }
}
