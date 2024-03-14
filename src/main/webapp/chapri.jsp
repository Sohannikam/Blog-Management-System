<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Text Editor</title>
    <style>
        #editor {
            border: 1px solid #ccc;
            padding: 10px;
            min-height: 200px;
        }

        button {
            margin-right: 5px;
        }
    </style>
</head>
<body>
    <div>
        <div>
            <button onclick="formatText('bold')">Bold</button>
            <button onclick="formatText('italic')">Italic</button>
            <button onclick="formatText('underline')">Underline</button>
        </div>
        <div id="editor" contenteditable="true">
            <!-- Initial content goes here -->
            This is a sample text.
        </div>
    </div>

    <script>
        function formatText(command) {
            document.execCommand(command, false, null);
        }
    </script>
</body>
</html>
