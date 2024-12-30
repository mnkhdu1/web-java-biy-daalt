<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Upload Product</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;700&family=Lato:wght@300;400;700&display=swap');

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            background-color: #1a1a1a;
            color: #e6d5c7;
            font-family: 'Lato', sans-serif;
        }

        header {
            background-color: #2c1810;
            padding: 15px 0;
            text-align: center;
            color: #e6d5c7;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
            font-family: 'Playfair Display', serif;
            font-size: 1.5rem;
        }

        .form-container {
            width: 80%;
            max-width: 600px;
            margin: 8rem auto;
            background-color: #2c1810;
            border: 1px solid #d4a373;
            border-radius: 12px;
            padding: 20px;
            box-shadow: 0 8px 16px rgba(212, 163, 115, 0.6);
        }

        h2 {
            text-align: center;
            font-family: 'Playfair Display', serif;
            color: #d4a373;
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 10px;
            font-weight: bold;
            color: #e6d5c7;
        }

        input[type="text"], input[type="file"], input[type="number"] {
            width: 100%;
            padding: 12px;
            margin-bottom: 15px;
            border: 1px solid #d4a373;
            border-radius: 4px;
            background: rgba(230, 213, 199, 0.1);
            color: #e6d5c7;
            font-family: 'Lato', sans-serif;
        }

        button {
            width: 100%;
            padding: 12px;
            background-color: #d4a373;
            color: #2c1810;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-family: 'Lato', sans-serif;
            font-weight: bold;
            font-size: 1rem;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #c89b6d;
        }

        input[type="file"]::file-selector-button {
            background-color: #d4a373;
            color: #2c1810;
            border: none;
            padding: 0.5rem 1rem;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="file"]::file-selector-button:hover {
            background-color: #c89b6d;
        }
    </style>
</head>
<body>

<jsp:include page="header.jsp" />

<div class="form-container">
    <h2>Upload Product</h2>
    <form action="UploadProductServlet" method="POST" enctype="multipart/form-data">
        <label for="name">Product Name:</label>
        <input type="text" id="name" name="name" placeholder="Enter the product name" required>

        <label for="description">Description:</label>
        <input type="text" id="description" name="description" placeholder="Enter a brief description" required>

        <label for="price">Price ($):</label>
        <input type="number" id="price" name="price" placeholder="Enter the product price" step="0.01" min="0" required>

        <label for="quantity">Quantity:</label>
        <input type="number" id="quantity" name="quantity" placeholder="Enter the product quantity" min="1" required>

        <label for="image">Product Image:</label>
        <input type="file" id="image" name="image" accept="image/*" required>

        <button type="submit">Upload Product</button>
    </form>
</div>

<script>
    const form = document.querySelector('form');
    const imageInput = document.getElementById('image');

    form.onsubmit = function() {
        const fileSize = imageInput.files[0].size / 1024 / 1024; // in MB
        if (fileSize > 5) {
            alert("File size exceeds 5MB. Please choose a smaller image.");
            return false;
        }
    };
</script>

</body>
</html>
