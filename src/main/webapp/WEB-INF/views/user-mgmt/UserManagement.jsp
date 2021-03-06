<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>AngularJS $http Example</title>

    <!--      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css"> -->
    <link href="<c:url value='/static/assert/css/bootstrap.min.css' />" rel="stylesheet"/>
    <link href="<c:url value='/static/user-mgmt/css/app.css' />" rel="stylesheet"/>
    <link href="<c:url value='/static/user-mgmt/css/angular_error_style.css' />" rel="stylesheet"/>
    <!--      <link href="../static/css/bootstrap.min.css />" rel="stylesheet" type="text/css" /> -->
    <!--      <link href="../static/css/app.css />" rel="stylesheet" type="text/css" /> -->
</head>
<body ng-app="myApp" class="ng-cloak">
<div class="generic-container" ng-controller="UserController as ctrl">
    <div class="panel panel-default">
        <div class="row">
            <div class="col-md-8">
                <div class="panel-heading">
                    <span class="lead">User Registration Form </span>
                </div>
            </div>
            <div class="col-md-4">
                <form name="searchBox" class="form-horizontal" ng-keyup=" $event.keyCode == 13 && ctrl.search()">
                    <div class="panel-heading">
                        <!-- if in form we do not have $event.keyCode == 13 -> action will alway be handle while typing -->
                        <input type="text" ng-model="ctrl.searchText" class="form-control"
                               placeholder="Search by name">
                    </div>
                </form>
            </div>


        </div>
        <div class="row">
            <form name="filter" class="form-horizontal">
                <div class="col-md-3">
                    <select class="form-control" ng-model="filter1"
                            ng-options="name.uid as name.value for name in ctrl.nameOptions">
                        <option>---</option>
                    </select>
                </div>

                <div class="col-md-3">
                    <select class="form-control" ng-model="filter2"
                            ng-options="addr.aid as addr.value for addr in ctrl.addrOptions">
                        <option>---</option>
                    </select>
                </div>
                <div class="col-md-3">
                    <span>ng-model value: {{filter1}}</span>
                    <span>ng-model value: {{filter2}}</span>
                </div>
                <div class="col-md-3">
                    <button type="button" class="btn btn-primary active" ng-click="ctrl.filter(filter1, filter2)">
                        Primary button
                    </button>
                </div>
            </form>
        </div>
        <br>
        <div class="formcontainer">
            <form ng-submit="ctrl.submit()" name="myForm" class="form-horizontal">
                <input type="hidden" ng-model="ctrl.user.id"/>
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-2 control-lable" for="file">Name</label>
                        <div class="col-md-7">
                            <input type="text" ng-model="ctrl.user.username" name="uname"
                                   class="username form-control input-sm"
                                   placeholder="Enter your name" required ng-minlength="3"/>
                            <div class="has-error" ng-show="myForm.$dirty">
                                <span ng-show="myForm.uname.$error.required">This is a required field</span> <span
                                    ng-show="myForm.uname.$error.minlength">Minimum
                                        length required is 3</span> <span
                                    ng-show="myForm.uname.$invalid">This field is invalid </span>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-2 control-lable" for="file">Address</label>
                        <div class="col-md-7">
                            <input type="text" ng-model="ctrl.user.address" class="form-control input-sm"
                                   placeholder="Enter your Address. [This field is validation free]"/>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-2 control-lable" for="file">Email</label>
                        <div class="col-md-7">
                            <input type="text" ng-model="ctrl.user.email" name="email"
                                   class="email form-control input-sm" placeholder="Enter your Email"
                                   required/>
                            <div class="has-error" ng-show="myForm.$dirty">
                                <span ng-show="myForm.email.$error.required">This is a required field</span> <span
                                    ng-show="myForm.email.$invalid">This
                                        field is invalid </span>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="form-actions floatRight">
                        <input type="submit" value="{{!ctrl.user.id ? 'Add' : 'Update'}}" class="btn btn-primary btn-sm"
                               ng-disabled="myForm.$invalid">
                        <button type="button" ng-click="ctrl.reset()" class="btn btn-warning btn-sm"
                                ng-disabled="myForm.$pristine">Reset Form
                        </button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <div class="panel panel-default">
        <!-- Default panel contents -->
        <div class="panel-heading">
            <span class="lead">List of Users </span>
        </div>
        <div class="tablecontainer">
            <table class="table table-hover">
                <thead>
                <tr>
                    <th>ID.</th>
                    <th>Name</th>
                    <th>Address</th>
                    <th>Email</th>
                    <th width="20%"></th>
                </tr>
                </thead>
                <tbody>
                <tr ng-repeat="u in ctrl.users">
                    <td><span ng-bind="u.id"></span></td>
                    <td><span ng-bind="u.username"></span></td>
                    <td><span ng-bind="u.address"></span></td>
                    <td><span ng-bind="u.email"></span></td>
                    <td>
                        <button type="button" ng-click="ctrl.edit(u.id)" class="btn btn-success custom-width">Edit
                        </button>
                        <button type="button" ng-click="ctrl.remove(u.id)" class="btn btn-danger custom-width">Remove
                        </button>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>

<!--       <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.4/angular.js"></script> -->
<script src="<c:url value='/static/assert/js/angular-1.4.6.js' />"></script>
<script src="<c:url value='/static/user-mgmt/js/app.js' />"></script>
<script src="<c:url value='/static/user-mgmt/js/service/user_service.js' />"></script>
<script src="<c:url value='/static/user-mgmt/js/controller/user_controller.js' />"></script>
</body>
</html>