<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 20px;
            background-color: #f4f4f4;
            color: #333;
        }

        h2 {
            text-align: center;
            color: #007BFF;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }

        th, td {
            text-align: center;
            padding: 12px;
            border: 1px solid #ddd;
        }

        th {
            background-color: #007BFF;
            color: #fff;
        }

        .center {
            width: 10%;
        }

        .highlight {
            background-color: #ffcccc; /* Червоний колір для підсвічування */
            font-weight: bold; /* Додатковий стиль, який може зробити текст більш виразним */
        }

        input[type="button"] {
            padding: 10px;
            margin: 5px;
            cursor: pointer;
            background-color: #007BFF;
            color: #fff;
            border: none;
            border-radius: 5px;
        }

        input[type="button"]:hover {
            background-color: #0056b3;
        }



    </style>
    <title> Dance studio Db</title>
</head>
<body>
<h2>All Children</h2>

<table>
    <thead>
    <tr>
        <th class="center">Name</th>
        <th class="center">Surname</th>
        <th class="center">Group name</th>
        <th class="center">Birthday</th>
        <th class="center">Health Certificate</th>
        <th class="center">Form</th>
        <th class="center">Safety Rules</th>
        <th class="center">Birth Certificate</th>
        <th class="center">Payment</th>
        <th class="center">Operation</th>
    </tr>
    </thead>
    <tbody>

    <#list allChild  as child>
        <#assign updateButton = "/updateInfo?childId=" + child.id>
        <#assign deleteButton = "/deleteChild?childId=" + child.id>
        <tr>
            <td class="center">${child.name}</td>
            <td class="center">${child.surname}</td>
            <td class="center">${child.group_name}</td>
            <td class="center">${child.birthday}</td>

            <td class="center<#if child.health_certificate == '-'> highlight </#if>">${child.health_certificate}</td>
            <td class="center<#if child.form == '-'> highlight </#if>">${child.form}</td>
            <td class="center<#if child.safety_rules == '-'> highlight </#if>">${child.safety_rules}</td>
            <td class="center<#if child.birth_certificate == '-'> highlight </#if>">${child.birth_certificate}</td>


            <td class="center">${child.payment}</td>
            <td class="center">
                <input type="button" value="Update" onclick="window.location.href='${updateButton}'"/>
                <input type="button" value="Delete" onclick="window.location.href='${deleteButton}'"/>
            </td>
        </tr>
    </#list>
    </tbody>
</table>

<input type="button" value="Add" onclick="window.location.href='addNewChild'"/>
<input type="button" value="Debtor" onclick="window.location.href='showAllDebtor'"/>
</body>
</html>


