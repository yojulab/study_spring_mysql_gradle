<%@ page import="java.util.HashMap, java.util.ArrayList" %>
    <!-- public ModelAndView list(ModelAndView modelAndView
, @RequestParam HashMap<String, Object> dataMap
, @RequestParam(name="deleteIds", required = false) ArrayList<String> deleteIds) { -->

    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Bootstrap 5 Template</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css">
    </head>

    <body>

        <!-- Menu -->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container">
                <a class="navbar-brand" href="#">Logo</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                    aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" href="/home">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/joinForm">joinForm</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Contact</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <!-- Main Content -->
        <form action="/commonCode/list" method="get">
            <div class="container mt-4">
                <div class="row">
                    <div class="col-9">
                        <h2>Search</h2>
                        <% HashMap dataMap=(HashMap)request.getAttribute("dataMap"); String
                            search=(String)dataMap.getOrDefault("search", "" ); %>
                            <div class="input-group m-3">
                                <!-- 셀렉트 박스 추가 -->
                                <select class="form-select" id="searchType" name="searchType">
                                    <option selected>Choose...</option>
                                    <option value="TITLE">Title</option>
                                    <option value="CONTENTS">Contents</option>
                                </select>
                                <input type="text" class="form-control" name="search" value="<%= search %>"
                                    placeholder="Search..." id="keydownEnter">
                                <button class="btn btn-primary">Go</button>
                            </div>
                    </div>
                    <div class="col-12">
                        <table class="table">
                            <thead>
                                <th>Delete</th> <!-- Added Delete column header -->
                                <th>PK_ID</th>
                                <th>FK_ID</th>
                                <th>NAME</th>
                            </thead>
                            <tbody>
                                <% ArrayList itemList=(ArrayList)request.getAttribute("itemList"); for(Object obj :
                                    itemList) { HashMap record=(HashMap)obj; %>
                                    <tr>
                                        <td>
                                            <!-- Bootstrap checkbox for Delete -->
                                            <input class="form-check-input" type="checkbox" 
                                                value='<%= record.get("PK_ID") %>' name="deleteIds">
                                        </td>
                                        <td>
                                            <%= record.get("PK_ID") %>
                                        </td>
                                        <td>
                                            <%= record.get("FK_ID") %>
                                        </td>
                                        <td>
                                            <%= record.get("NAME") %>
                                        </td>
                                    </tr>
                                    <% } %>
                            </tbody>
                        </table>

                    </div>
                </div>
                <!-- Pagination with buttons and query parameters -->
                <nav aria-label="Page navigation">
                    <ul class="pagination justify-content-center">
                        <li class="page-item"><button class="page-link" type="submit" name="page"
                                value="Previous">Previous</button></li>
                        <li class="page-item"><button class="page-link" type="submit" name="page" value="1">1</button>
                        </li>
                        <li class="page-item"><button class="page-link" type="submit" name="page" value="2">2</button>
                        </li>
                        <li class="page-item"><button class="page-link" type="submit" name="page" value="3">3</button>
                        </li>
                        <li class="page-item"><button class="page-link" type="submit" name="page"
                                value="Next">Next</button>
                        </li>
                    </ul>
                </nav>
            </div>

        </form>


        <!-- Footer -->
        <footer class="bg-dark text-white text-center py-4 mt-4">
            <div class="container">
                <p>&copy; 2023 Your Website. All Rights Reserved.</p>
            </div>
        </footer>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>

    </html>