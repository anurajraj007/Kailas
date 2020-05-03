<%@ Page Title="" Language="C#" MasterPageFile="~/Core/Masters/Admin.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="KAILAS_CS.Core.Src.Admin.Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

<%--<meta http-equiv="Cache-Control" content="no-cache" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="0" />--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div id="page_wrapper" style="min-height: 364px;">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Dashboard</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-comments fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge">26</div>
                                    <div>New Comments!</div>
                                </div>
                            </div>
                        </div>
                        <a href="#">
                            <div class="panel-footer">
                                <span class="pull-left">View Details</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-green">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-tasks fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge">12</div>
                                    <div>New Tasks!</div>
                                </div>
                            </div>
                        </div>
                        <a href="#">
                            <div class="panel-footer">
                                <span class="pull-left">View Details</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-yellow">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-shopping-cart fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge">124</div>
                                    <div>New Orders!</div>
                                </div>
                            </div>
                        </div>
                        <a href="#">
                            <div class="panel-footer">
                                <span class="pull-left">View Details</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-red">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-support fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge">13</div>
                                    <div>Support Tickets!</div>
                                </div>
                            </div>
                        </div>
                        <a href="#">
                            <div class="panel-footer">
                                <span class="pull-left">View Details</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-8">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <i class="fa fa-bar-chart-o fa-fw"></i> Area Chart Example
                            <div class="pull-right">
                                <div class="btn-group">
                                    <button data-toggle="dropdown" class="btn btn-default btn-xs dropdown-toggle" type="button">
                                        Actions
                                        <span class="caret"></span>
                                    </button>
                                    <ul role="menu" class="dropdown-menu pull-right">
                                        <li><a href="#">Action</a>
                                        </li>
                                        <li><a href="#">Another action</a>
                                        </li>
                                        <li><a href="#">Something else here</a>
                                        </li>
                                        <li class="divider"></li>
                                        <li><a href="#">Separated link</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div id="morris-area-chart" style="position: relative;"><svg height="342" version="1.1" width="593" xmlns="http://www.w3.org/2000/svg" style="overflow: hidden; position: relative; top: -0.75px;"><desc>Created with RaphaÃ«l 2.1.2</desc><defs/><text style="text-anchor: end; font: 12px sans-serif;" x="53.5" y="307" text-anchor="end" font="10px &quot;Arial&quot;" stroke="none" fill="#888888" font-size="12px" font-family="sans-serif" font-weight="normal"><tspan dy="4.5">0</tspan></text><path style="" fill="none" stroke="#aaaaaa" d="M66,307H568" stroke-width="0.5"/><text style="text-anchor: end; font: 12px sans-serif;" x="53.5" y="236.5" text-anchor="end" font="10px &quot;Arial&quot;" stroke="none" fill="#888888" font-size="12px" font-family="sans-serif" font-weight="normal"><tspan dy="4.5">7,500</tspan></text><path style="" fill="none" stroke="#aaaaaa" d="M66,236.5H568" stroke-width="0.5"/><text style="text-anchor: end; font: 12px sans-serif;" x="53.5" y="166" text-anchor="end" font="10px &quot;Arial&quot;" stroke="none" fill="#888888" font-size="12px" font-family="sans-serif" font-weight="normal"><tspan dy="4.5">15,000</tspan></text><path style="" fill="none" stroke="#aaaaaa" d="M66,166H568" stroke-width="0.5"/><text style="text-anchor: end; font: 12px sans-serif;" x="53.5" y="95.5" text-anchor="end" font="10px &quot;Arial&quot;" stroke="none" fill="#888888" font-size="12px" font-family="sans-serif" font-weight="normal"><tspan dy="4.5">22,500</tspan></text><path style="" fill="none" stroke="#aaaaaa" d="M66,95.5H568" stroke-width="0.5"/><text style="text-anchor: end; font: 12px sans-serif;" x="53.5" y="25" text-anchor="end" font="10px &quot;Arial&quot;" stroke="none" fill="#888888" font-size="12px" font-family="sans-serif" font-weight="normal"><tspan dy="4.5">30,000</tspan></text><path style="" fill="none" stroke="#aaaaaa" d="M66,25H568" stroke-width="0.5"/><text style="text-anchor: middle; font: 12px sans-serif;" x="475.28554070473876" y="319.5" text-anchor="middle" font="10px &quot;Arial&quot;" stroke="none" fill="#888888" font-size="12px" font-family="sans-serif" font-weight="normal" transform="matrix(1,0,0,1,0,7.5)"><tspan dy="4.5">2012</tspan></text><text style="text-anchor: middle; font: 12px sans-serif;" x="252.64884568651277" y="319.5" text-anchor="middle" font="10px &quot;Arial&quot;" stroke="none" fill="#888888" font-size="12px" font-family="sans-serif" font-weight="normal" transform="matrix(1,0,0,1,0,7.5)"><tspan dy="4.5">2011</tspan></text><path style="fill-opacity: 1;" fill="#7cb47c" stroke="none" d="M66,257.0578C80.02916160388821,251.88779999999997,108.08748481166464,241.15887499999997,122.11664641555285,236.37779999999998C136.14580801944106,231.596725,164.2041312272175,225.35427103825134,178.2332928311057,218.80919999999998C192.10996354799514,212.33527103825134,219.863304981774,186.23353895027626,233.73997569866344,184.30180000000001C247.4641555285541,182.39128895027625,274.91251518833536,202.03523571428573,288.636695018226,203.4402C302.66585662211423,204.87638571428573,330.72417982989066,194.70995000000002,344.75334143377887,195.6664C358.7825030376671,196.62285,386.8408262454435,228.06999781420762,400.8699878493317,211.09179999999998C414.7466585662212,194.29814781420762,442.5,68.77109999999998,456.37667071688946,60.57899999999998C470.25334143377887,52.38689999999999,498.00668286755774,133.54317404371585,511.88335358444715,145.555C525.9125151883354,157.69882404371586,553.9708383961117,154.28994999999998,568,157.20159999999998L568,307L66,307Z" fill-opacity="1"/><path style="" fill="none" stroke="#4da74d" d="M66,257.0578C80.02916160388821,251.88779999999997,108.08748481166464,241.15887499999997,122.11664641555285,236.37779999999998C136.14580801944106,231.596725,164.2041312272175,225.35427103825134,178.2332928311057,218.80919999999998C192.10996354799514,212.33527103825134,219.863304981774,186.23353895027626,233.73997569866344,184.30180000000001C247.4641555285541,182.39128895027625,274.91251518833536,202.03523571428573,288.636695018226,203.4402C302.66585662211423,204.87638571428573,330.72417982989066,194.70995000000002,344.75334143377887,195.6664C358.7825030376671,196.62285,386.8408262454435,228.06999781420762,400.8699878493317,211.09179999999998C414.7466585662212,194.29814781420762,442.5,68.77109999999998,456.37667071688946,60.57899999999998C470.25334143377887,52.38689999999999,498.00668286755774,133.54317404371585,511.88335358444715,145.555C525.9125151883354,157.69882404371586,553.9708383961117,154.28994999999998,568,157.20159999999998" stroke-width="3"/><circle cx="66" cy="257.0578" r="2" fill="#4da74d" stroke="#ffffff" style="" stroke-width="1"/><circle cx="122.11664641555285" cy="236.37779999999998" r="2" fill="#4da74d" stroke="#ffffff" style="" stroke-width="1"/><circle cx="178.2332928311057" cy="218.80919999999998" r="2" fill="#4da74d" stroke="#ffffff" style="" stroke-width="1"/><circle cx="233.73997569866344" cy="184.30180000000001" r="2" fill="#4da74d" stroke="#ffffff" style="" stroke-width="1"/><circle cx="288.636695018226" cy="203.4402" r="2" fill="#4da74d" stroke="#ffffff" style="" stroke-width="1"/><circle cx="344.75334143377887" cy="195.6664" r="2" fill="#4da74d" stroke="#ffffff" style="" stroke-width="1"/><circle cx="400.8699878493317" cy="211.09179999999998" r="2" fill="#4da74d" stroke="#ffffff" style="" stroke-width="1"/><circle cx="456.37667071688946" cy="60.57899999999998" r="2" fill="#4da74d" stroke="#ffffff" style="" stroke-width="1"/><circle cx="511.88335358444715" cy="145.555" r="2" fill="#4da74d" stroke="#ffffff" style="" stroke-width="1"/><circle cx="568" cy="157.20159999999998" r="2" fill="#4da74d" stroke="#ffffff" style="" stroke-width="1"/><path style="fill-opacity: 1;" fill="#a7b3bc" stroke="none" d="M66,281.9396C80.02916160388821,276.28549999999996,108.08748481166464,264.275825,122.11664641555285,259.3232C136.14580801944106,254.37057499999997,164.2041312272175,245.02641639344262,178.2332928311057,242.3186C192.10996354799514,239.6402163934426,219.863304981774,239.9558892265193,233.73997569866344,237.77839999999998C247.4641555285541,235.6248392265193,274.91251518833536,228.01466648351646,288.636695018226,224.99439999999998C302.66585662211423,221.9070164835165,330.72417982989066,213.219725,344.75334143377887,213.3478C358.7825030376671,213.475875,386.8408262454435,239.10559781420767,400.8699878493317,226.019C414.7466585662212,213.07464781420765,442.5,116.89909999999999,456.37667071688946,109.22399999999999C470.25334143377887,101.54889999999999,498.00668286755774,156.5608461748634,511.88335358444715,164.6182C525.9125151883354,172.7640961748634,553.9708383961117,171.6823,568,174.037L568,307L66,307Z" fill-opacity="1"/><path style="" fill="none" stroke="#7a92a3" d="M66,281.9396C80.02916160388821,276.28549999999996,108.08748481166464,264.275825,122.11664641555285,259.3232C136.14580801944106,254.37057499999997,164.2041312272175,245.02641639344262,178.2332928311057,242.3186C192.10996354799514,239.6402163934426,219.863304981774,239.9558892265193,233.73997569866344,237.77839999999998C247.4641555285541,235.6248392265193,274.91251518833536,228.01466648351646,288.636695018226,224.99439999999998C302.66585662211423,221.9070164835165,330.72417982989066,213.219725,344.75334143377887,213.3478C358.7825030376671,213.475875,386.8408262454435,239.10559781420767,400.8699878493317,226.019C414.7466585662212,213.07464781420765,442.5,116.89909999999999,456.37667071688946,109.22399999999999C470.25334143377887,101.54889999999999,498.00668286755774,156.5608461748634,511.88335358444715,164.6182C525.9125151883354,172.7640961748634,553.9708383961117,171.6823,568,174.037" stroke-width="3"/><circle cx="66" cy="281.9396" r="2" fill="#7a92a3" stroke="#ffffff" style="" stroke-width="1"/><circle cx="122.11664641555285" cy="259.3232" r="2" fill="#7a92a3" stroke="#ffffff" style="" stroke-width="1"/><circle cx="178.2332928311057" cy="242.3186" r="2" fill="#7a92a3" stroke="#ffffff" style="" stroke-width="1"/><circle cx="233.73997569866344" cy="237.77839999999998" r="2" fill="#7a92a3" stroke="#ffffff" style="" stroke-width="1"/><circle cx="288.636695018226" cy="224.99439999999998" r="2" fill="#7a92a3" stroke="#ffffff" style="" stroke-width="1"/><circle cx="344.75334143377887" cy="213.3478" r="2" fill="#7a92a3" stroke="#ffffff" style="" stroke-width="1"/><circle cx="400.8699878493317" cy="226.019" r="2" fill="#7a92a3" stroke="#ffffff" style="" stroke-width="1"/><circle cx="456.37667071688946" cy="109.22399999999999" r="2" fill="#7a92a3" stroke="#ffffff" style="" stroke-width="1"/><circle cx="511.88335358444715" cy="164.6182" r="2" fill="#7a92a3" stroke="#ffffff" style="" stroke-width="1"/><circle cx="568" cy="174.037" r="2" fill="#7a92a3" stroke="#ffffff" style="" stroke-width="1"/><path style="fill-opacity: 1;" fill="#2577b5" stroke="none" d="M66,281.9396C80.02916160388821,281.6764,108.08748481166464,283.52585,122.11664641555285,280.8868C136.14580801944106,278.24775,164.2041312272175,261.99562513661203,178.2332928311057,260.8272C192.10996354799514,259.671475136612,219.863304981774,273.8326712707182,233.73997569866344,271.5902C247.4641555285541,269.3723712707182,274.91251518833536,245.1974532967033,288.636695018226,242.986C302.66585662211423,240.7254032967033,330.72417982989066,251.36374999999998,344.75334143377887,253.702C358.7825030376671,256.04025,386.8408262454435,272.8008994535519,400.8699878493317,261.692C414.7466585662212,250.70384945355192,442.5,172.207525,456.37667071688946,165.3138C470.25334143377887,158.420075,498.00668286755774,198.78166530054642,511.88335358444715,206.54219999999998C525.9125151883354,214.38801530054644,553.9708383961117,222.43994999999998,568,227.73919999999998L568,307L66,307Z" fill-opacity="1"/><path style="" fill="none" stroke="#0b62a4" d="M66,281.9396C80.02916160388821,281.6764,108.08748481166464,283.52585,122.11664641555285,280.8868C136.14580801944106,278.24775,164.2041312272175,261.99562513661203,178.2332928311057,260.8272C192.10996354799514,259.671475136612,219.863304981774,273.8326712707182,233.73997569866344,271.5902C247.4641555285541,269.3723712707182,274.91251518833536,245.1974532967033,288.636695018226,242.986C302.66585662211423,240.7254032967033,330.72417982989066,251.36374999999998,344.75334143377887,253.702C358.7825030376671,256.04025,386.8408262454435,272.8008994535519,400.8699878493317,261.692C414.7466585662212,250.70384945355192,442.5,172.207525,456.37667071688946,165.3138C470.25334143377887,158.420075,498.00668286755774,198.78166530054642,511.88335358444715,206.54219999999998C525.9125151883354,214.38801530054644,553.9708383961117,222.43994999999998,568,227.73919999999998" stroke-width="3"/><circle cx="66" cy="281.9396" r="2" fill="#0b62a4" stroke="#ffffff" style="" stroke-width="1"/><circle cx="122.11664641555285" cy="280.8868" r="2" fill="#0b62a4" stroke="#ffffff" style="" stroke-width="1"/><circle cx="178.2332928311057" cy="260.8272" r="2" fill="#0b62a4" stroke="#ffffff" style="" stroke-width="1"/><circle cx="233.73997569866344" cy="271.5902" r="2" fill="#0b62a4" stroke="#ffffff" style="" stroke-width="1"/><circle cx="288.636695018226" cy="242.986" r="2" fill="#0b62a4" stroke="#ffffff" style="" stroke-width="1"/><circle cx="344.75334143377887" cy="253.702" r="2" fill="#0b62a4" stroke="#ffffff" style="" stroke-width="1"/><circle cx="400.8699878493317" cy="261.692" r="2" fill="#0b62a4" stroke="#ffffff" style="" stroke-width="1"/><circle cx="456.37667071688946" cy="165.3138" r="2" fill="#0b62a4" stroke="#ffffff" style="" stroke-width="1"/><circle cx="511.88335358444715" cy="206.54219999999998" r="2" fill="#0b62a4" stroke="#ffffff" style="" stroke-width="1"/><circle cx="568" cy="227.73919999999998" r="2" fill="#0b62a4" stroke="#ffffff" style="" stroke-width="1"/></svg><div class="morris-hover morris-default-style" style="display: none; left: 9px; top: 177px;"><div class="morris-hover-row-label">2010 Q1</div><div style="color: #0b62a4" class="morris-hover-point">
  iPhone:
  2,666
</div><div style="color: #7A92A3" class="morris-hover-point">
  iPad:
  -
</div><div style="color: #4da74d" class="morris-hover-point">
  iPod Touch:
  2,647
</div></div></div>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <i class="fa fa-bar-chart-o fa-fw"></i> Bar Chart Example
                            <div class="pull-right">
                                <div class="btn-group">
                                    <button data-toggle="dropdown" class="btn btn-default btn-xs dropdown-toggle" type="button">
                                        Actions
                                        <span class="caret"></span>
                                    </button>
                                    <ul role="menu" class="dropdown-menu pull-right">
                                        <li><a href="#">Action</a>
                                        </li>
                                        <li><a href="#">Another action</a>
                                        </li>
                                        <li><a href="#">Something else here</a>
                                        </li>
                                        <li class="divider"></li>
                                        <li><a href="#">Separated link</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-4">
                                    <div class="table-responsive">
                                        <table class="table table-bordered table-hover table-striped">
                                            <thead>
                                                <tr>
                                                    <th>#</th>
                                                    <th>Date</th>
                                                    <th>Time</th>
                                                    <th>Amount</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>3326</td>
                                                    <td>10/21/2013</td>
                                                    <td>3:29 PM</td>
                                                    <td>$321.33</td>
                                                </tr>
                                                <tr>
                                                    <td>3325</td>
                                                    <td>10/21/2013</td>
                                                    <td>3:20 PM</td>
                                                    <td>$234.34</td>
                                                </tr>
                                                <tr>
                                                    <td>3324</td>
                                                    <td>10/21/2013</td>
                                                    <td>3:03 PM</td>
                                                    <td>$724.17</td>
                                                </tr>
                                                <tr>
                                                    <td>3323</td>
                                                    <td>10/21/2013</td>
                                                    <td>3:00 PM</td>
                                                    <td>$23.71</td>
                                                </tr>
                                                <tr>
                                                    <td>3322</td>
                                                    <td>10/21/2013</td>
                                                    <td>2:49 PM</td>
                                                    <td>$8345.23</td>
                                                </tr>
                                                <tr>
                                                    <td>3321</td>
                                                    <td>10/21/2013</td>
                                                    <td>2:23 PM</td>
                                                    <td>$245.12</td>
                                                </tr>
                                                <tr>
                                                    <td>3320</td>
                                                    <td>10/21/2013</td>
                                                    <td>2:15 PM</td>
                                                    <td>$5663.54</td>
                                                </tr>
                                                <tr>
                                                    <td>3319</td>
                                                    <td>10/21/2013</td>
                                                    <td>2:13 PM</td>
                                                    <td>$943.45</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <!-- /.table-responsive -->
                                </div>
                                <!-- /.col-lg-4 (nested) -->
                                <div class="col-lg-8">
                                    <div id="morris-bar-chart" style="position: relative;"><svg height="342" version="1.1" width="385" xmlns="http://www.w3.org/2000/svg" style="overflow: hidden; position: relative; left: -0.549988px; top: -0.75px;"><desc>Created with RaphaÃ«l 2.1.2</desc><defs/><text style="text-anchor: end; font: 12px sans-serif;" x="36.5" y="307" text-anchor="end" font="10px &quot;Arial&quot;" stroke="none" fill="#888888" font-size="12px" font-family="sans-serif" font-weight="normal"><tspan dy="4.5">0</tspan></text><path style="" fill="none" stroke="#aaaaaa" d="M49,307H360" stroke-width="0.5"/><text style="text-anchor: end; font: 12px sans-serif;" x="36.5" y="236.5" text-anchor="end" font="10px &quot;Arial&quot;" stroke="none" fill="#888888" font-size="12px" font-family="sans-serif" font-weight="normal"><tspan dy="4.5">25</tspan></text><path style="" fill="none" stroke="#aaaaaa" d="M49,236.5H360" stroke-width="0.5"/><text style="text-anchor: end; font: 12px sans-serif;" x="36.5" y="166" text-anchor="end" font="10px &quot;Arial&quot;" stroke="none" fill="#888888" font-size="12px" font-family="sans-serif" font-weight="normal"><tspan dy="4.5">50</tspan></text><path style="" fill="none" stroke="#aaaaaa" d="M49,166H360" stroke-width="0.5"/><text style="text-anchor: end; font: 12px sans-serif;" x="36.5" y="95.5" text-anchor="end" font="10px &quot;Arial&quot;" stroke="none" fill="#888888" font-size="12px" font-family="sans-serif" font-weight="normal"><tspan dy="4.5">75</tspan></text><path style="" fill="none" stroke="#aaaaaa" d="M49,95.5H360" stroke-width="0.5"/><text style="text-anchor: end; font: 12px sans-serif;" x="36.5" y="25" text-anchor="end" font="10px &quot;Arial&quot;" stroke="none" fill="#888888" font-size="12px" font-family="sans-serif" font-weight="normal"><tspan dy="4.5">100</tspan></text><path style="" fill="none" stroke="#aaaaaa" d="M49,25H360" stroke-width="0.5"/><text style="text-anchor: middle; font: 12px sans-serif;" x="337.7857142857143" y="319.5" text-anchor="middle" font="10px &quot;Arial&quot;" stroke="none" fill="#888888" font-size="12px" font-family="sans-serif" font-weight="normal" transform="matrix(1,0,0,1,0,7.5)"><tspan dy="4.5">2012</tspan></text><text style="text-anchor: middle; font: 12px sans-serif;" x="248.92857142857142" y="319.5" text-anchor="middle" font="10px &quot;Arial&quot;" stroke="none" fill="#888888" font-size="12px" font-family="sans-serif" font-weight="normal" transform="matrix(1,0,0,1,0,7.5)"><tspan dy="4.5">2010</tspan></text><text style="text-anchor: middle; font: 12px sans-serif;" x="160.07142857142856" y="319.5" text-anchor="middle" font="10px &quot;Arial&quot;" stroke="none" fill="#888888" font-size="12px" font-family="sans-serif" font-weight="normal" transform="matrix(1,0,0,1,0,7.5)"><tspan dy="4.5">2008</tspan></text><text style="text-anchor: middle; font: 12px sans-serif;" x="71.21428571428572" y="319.5" text-anchor="middle" font="10px &quot;Arial&quot;" stroke="none" fill="#888888" font-size="12px" font-family="sans-serif" font-weight="normal" transform="matrix(1,0,0,1,0,7.5)"><tspan dy="4.5">2006</tspan></text><rect x="54.55357142857143" y="25" width="15.160714285714285" height="282" r="0" rx="0" ry="0" fill="#0b62a4" stroke="none" style="fill-opacity: 1;" fill-opacity="1"/><rect x="72.71428571428572" y="53.20000000000002" width="15.160714285714285" height="253.79999999999998" r="0" rx="0" ry="0" fill="#7a92a3" stroke="none" style="fill-opacity: 1;" fill-opacity="1"/><rect x="98.98214285714286" y="95.5" width="15.160714285714285" height="211.5" r="0" rx="0" ry="0" fill="#0b62a4" stroke="none" style="fill-opacity: 1;" fill-opacity="1"/><rect x="117.14285714285714" y="123.70000000000002" width="15.160714285714285" height="183.29999999999998" r="0" rx="0" ry="0" fill="#7a92a3" stroke="none" style="fill-opacity: 1;" fill-opacity="1"/><rect x="143.41071428571428" y="166" width="15.160714285714285" height="141" r="0" rx="0" ry="0" fill="#0b62a4" stroke="none" style="fill-opacity: 1;" fill-opacity="1"/><rect x="161.57142857142856" y="194.2" width="15.160714285714285" height="112.80000000000001" r="0" rx="0" ry="0" fill="#7a92a3" stroke="none" style="fill-opacity: 1;" fill-opacity="1"/><rect x="187.83928571428572" y="95.5" width="15.160714285714285" height="211.5" r="0" rx="0" ry="0" fill="#0b62a4" stroke="none" style="fill-opacity: 1;" fill-opacity="1"/><rect x="206" y="123.70000000000002" width="15.160714285714285" height="183.29999999999998" r="0" rx="0" ry="0" fill="#7a92a3" stroke="none" style="fill-opacity: 1;" fill-opacity="1"/><rect x="232.26785714285717" y="166" width="15.160714285714285" height="141" r="0" rx="0" ry="0" fill="#0b62a4" stroke="none" style="fill-opacity: 1;" fill-opacity="1"/><rect x="250.42857142857144" y="194.2" width="15.160714285714285" height="112.80000000000001" r="0" rx="0" ry="0" fill="#7a92a3" stroke="none" style="fill-opacity: 1;" fill-opacity="1"/><rect x="276.6964285714286" y="95.5" width="15.160714285714285" height="211.5" r="0" rx="0" ry="0" fill="#0b62a4" stroke="none" style="fill-opacity: 1;" fill-opacity="1"/><rect x="294.8571428571429" y="123.70000000000002" width="15.160714285714285" height="183.29999999999998" r="0" rx="0" ry="0" fill="#7a92a3" stroke="none" style="fill-opacity: 1;" fill-opacity="1"/><rect x="321.125" y="25" width="15.160714285714285" height="282" r="0" rx="0" ry="0" fill="#0b62a4" stroke="none" style="fill-opacity: 1;" fill-opacity="1"/><rect x="339.2857142857143" y="53.20000000000002" width="15.160714285714285" height="253.79999999999998" r="0" rx="0" ry="0" fill="#7a92a3" stroke="none" style="fill-opacity: 1;" fill-opacity="1"/></svg><div class="morris-hover morris-default-style" style="display: none;"></div></div>
                                </div>
                                <!-- /.col-lg-8 (nested) -->
                            </div>
                            <!-- /.row -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <i class="fa fa-clock-o fa-fw"></i> Responsive Timeline
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <ul class="timeline">
                                <li>
                                    <div class="timeline-badge"><i class="fa fa-check"></i>
                                    </div>
                                    <div class="timeline-panel">
                                        <div class="timeline-heading">
                                            <h4 class="timeline-title">Lorem ipsum dolor</h4>
                                            <p><small class="text-muted"><i class="fa fa-clock-o"></i> 11 hours ago via Twitter</small>
                                            </p>
                                        </div>
                                        <div class="timeline-body">
                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Libero laboriosam dolor perspiciatis omnis exercitationem. Beatae, officia pariatur? Est cum veniam excepturi. Maiores praesentium, porro voluptas suscipit facere rem dicta, debitis.</p>
                                        </div>
                                    </div>
                                </li>
                                <li class="timeline-inverted">
                                    <div class="timeline-badge warning"><i class="fa fa-credit-card"></i>
                                    </div>
                                    <div class="timeline-panel">
                                        <div class="timeline-heading">
                                            <h4 class="timeline-title">Lorem ipsum dolor</h4>
                                        </div>
                                        <div class="timeline-body">
                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Autem dolorem quibusdam, tenetur commodi provident cumque magni voluptatem libero, quis rerum. Fugiat esse debitis optio, tempore. Animi officiis alias, officia repellendus.</p>
                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Laudantium maiores odit qui est tempora eos, nostrum provident explicabo dignissimos debitis vel! Adipisci eius voluptates, ad aut recusandae minus eaque facere.</p>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="timeline-badge danger"><i class="fa fa-bomb"></i>
                                    </div>
                                    <div class="timeline-panel">
                                        <div class="timeline-heading">
                                            <h4 class="timeline-title">Lorem ipsum dolor</h4>
                                        </div>
                                        <div class="timeline-body">
                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Repellendus numquam facilis enim eaque, tenetur nam id qui vel velit similique nihil iure molestias aliquam, voluptatem totam quaerat, magni commodi quisquam.</p>
                                        </div>
                                    </div>
                                </li>
                                <li class="timeline-inverted">
                                    <div class="timeline-panel">
                                        <div class="timeline-heading">
                                            <h4 class="timeline-title">Lorem ipsum dolor</h4>
                                        </div>
                                        <div class="timeline-body">
                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptates est quaerat asperiores sapiente, eligendi, nihil. Itaque quos, alias sapiente rerum quas odit! Aperiam officiis quidem delectus libero, omnis ut debitis!</p>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="timeline-badge info"><i class="fa fa-save"></i>
                                    </div>
                                    <div class="timeline-panel">
                                        <div class="timeline-heading">
                                            <h4 class="timeline-title">Lorem ipsum dolor</h4>
                                        </div>
                                        <div class="timeline-body">
                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nobis minus modi quam ipsum alias at est molestiae excepturi delectus nesciunt, quibusdam debitis amet, beatae consequuntur impedit nulla qui! Laborum, atque.</p>
                                            <hr>
                                            <div class="btn-group">
                                                <button data-toggle="dropdown" class="btn btn-primary btn-sm dropdown-toggle" type="button">
                                                    <i class="fa fa-gear"></i>  <span class="caret"></span>
                                                </button>
                                                <ul role="menu" class="dropdown-menu">
                                                    <li><a href="#">Action</a>
                                                    </li>
                                                    <li><a href="#">Another action</a>
                                                    </li>
                                                    <li><a href="#">Something else here</a>
                                                    </li>
                                                    <li class="divider"></li>
                                                    <li><a href="#">Separated link</a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="timeline-panel">
                                        <div class="timeline-heading">
                                            <h4 class="timeline-title">Lorem ipsum dolor</h4>
                                        </div>
                                        <div class="timeline-body">
                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sequi fuga odio quibusdam. Iure expedita, incidunt unde quis nam! Quod, quisquam. Officia quam qui adipisci quas consequuntur nostrum sequi. Consequuntur, commodi.</p>
                                        </div>
                                    </div>
                                </li>
                                <li class="timeline-inverted">
                                    <div class="timeline-badge success"><i class="fa fa-graduation-cap"></i>
                                    </div>
                                    <div class="timeline-panel">
                                        <div class="timeline-heading">
                                            <h4 class="timeline-title">Lorem ipsum dolor</h4>
                                        </div>
                                        <div class="timeline-body">
                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Deserunt obcaecati, quaerat tempore officia voluptas debitis consectetur culpa amet, accusamus dolorum fugiat, animi dicta aperiam, enim incidunt quisquam maxime neque eaque.</p>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-8 -->
                <div class="col-lg-4">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <i class="fa fa-bell fa-fw"></i> Notifications Panel
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="list-group">
                                <a class="list-group-item" href="#">
                                    <i class="fa fa-comment fa-fw"></i> New Comment
                                    <span class="pull-right text-muted small"><em>4 minutes ago</em>
                                    </span>
                                </a>
                                <a class="list-group-item" href="#">
                                    <i class="fa fa-twitter fa-fw"></i> 3 New Followers
                                    <span class="pull-right text-muted small"><em>12 minutes ago</em>
                                    </span>
                                </a>
                                <a class="list-group-item" href="#">
                                    <i class="fa fa-envelope fa-fw"></i> Message Sent
                                    <span class="pull-right text-muted small"><em>27 minutes ago</em>
                                    </span>
                                </a>
                                <a class="list-group-item" href="#">
                                    <i class="fa fa-tasks fa-fw"></i> New Task
                                    <span class="pull-right text-muted small"><em>43 minutes ago</em>
                                    </span>
                                </a>
                                <a class="list-group-item" href="#">
                                    <i class="fa fa-upload fa-fw"></i> Server Rebooted
                                    <span class="pull-right text-muted small"><em>11:32 AM</em>
                                    </span>
                                </a>
                                <a class="list-group-item" href="#">
                                    <i class="fa fa-bolt fa-fw"></i> Server Crashed!
                                    <span class="pull-right text-muted small"><em>11:13 AM</em>
                                    </span>
                                </a>
                                <a class="list-group-item" href="#">
                                    <i class="fa fa-warning fa-fw"></i> Server Not Responding
                                    <span class="pull-right text-muted small"><em>10:57 AM</em>
                                    </span>
                                </a>
                                <a class="list-group-item" href="#">
                                    <i class="fa fa-shopping-cart fa-fw"></i> New Order Placed
                                    <span class="pull-right text-muted small"><em>9:49 AM</em>
                                    </span>
                                </a>
                                <a class="list-group-item" href="#">
                                    <i class="fa fa-money fa-fw"></i> Payment Received
                                    <span class="pull-right text-muted small"><em>Yesterday</em>
                                    </span>
                                </a>
                            </div>
                            <!-- /.list-group -->
                            <a class="btn btn-default btn-block" href="#">View All Alerts</a>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <i class="fa fa-bar-chart-o fa-fw"></i> Donut Chart Example
                        </div>
                        <div class="panel-body">
                            <div id="morris-donut-chart"><svg height="342" version="1.1" width="265" xmlns="http://www.w3.org/2000/svg" style="overflow: hidden; position: relative; left: -0.666687px; top: -0.75px;"><desc>Created with RaphaÃ«l 2.1.2</desc><defs/><path style="opacity: 0;" fill="none" stroke="#0b62a4" d="M132.5,255.16666666666669A81.66666666666667,81.66666666666667,0,0,0,209.78438662653912,199.89257524767265" stroke-width="2" opacity="0"/><path style="" fill="#0b62a4" stroke="#ffffff" d="M132.5,258.1666666666667A84.66666666666667,84.66666666666667,0,0,0,212.62340491077936,200.86209842003615L243.69488279940833,211.47299091756986A117.5,117.5,0,0,1,132.5,291Z" stroke-width="3"/><path style="opacity: 1;" fill="none" stroke="#3980b5" d="M209.78438662653912,199.89257524767265A81.66666666666667,81.66666666666667,0,0,0,59.25815675575605,137.37415270709846" stroke-width="2" opacity="1"/><path style="" fill="#3980b5" stroke="#ffffff" d="M212.62340491077936,200.86209842003615A84.66666666666667,84.66666666666667,0,0,0,56.56764006515117,136.04708076572655L22.63723513363408,119.31122906064766A122.5,122.5,0,0,1,248.42657993980868,213.08886287150898Z" stroke-width="3"/><path style="opacity: 0;" fill="none" stroke="#679dc6" d="M59.25815675575605,137.37415270709846A81.66666666666667,81.66666666666667,0,0,0,132.4743436604178,255.16666263657822" stroke-width="2" opacity="0"/><path style="" fill="#679dc6" stroke="#ffffff" d="M56.56764006515117,136.04708076572655A84.66666666666667,84.66666666666667,0,0,0,132.47340118263722,258.1666624885342L132.46308628692765,290.9999942016075A117.5,117.5,0,0,1,27.12142961797555,121.52301562960082Z" stroke-width="3"/><text style="text-anchor: middle; font: 800 15px &quot;Arial&quot;;" x="132.5" y="163.5" text-anchor="middle" font="10px &quot;Arial&quot;" stroke="none" fill="#000000" font-size="15px" font-weight="800" transform="matrix(1.4272,0,0,1.4272,-56.8155,-73.6893)" stroke-width="0.7006802721088435"><tspan dy="5">In-Store Sales</tspan></text><text style="text-anchor: middle; font: 14px &quot;Arial&quot;;" x="132.5" y="183.5" text-anchor="middle" font="10px &quot;Arial&quot;" stroke="none" fill="#000000" font-size="14px" transform="matrix(1.7014,0,0,1.7014,-93.2847,-123.0938)" stroke-width="0.5877551020408163"><tspan dy="5">30</tspan></text></svg></div>
                            <a class="btn btn-default btn-block" href="#">View Details</a>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                    <div class="chat-panel panel panel-default">
                        <div class="panel-heading">
                            <i class="fa fa-comments fa-fw"></i>
                            Chat
                            <div class="btn-group pull-right">
                                <button data-toggle="dropdown" class="btn btn-default btn-xs dropdown-toggle" type="button">
                                    <i class="fa fa-chevron-down"></i>
                                </button>
                                <ul class="dropdown-menu slidedown">
                                    <li>
                                        <a href="#">
                                            <i class="fa fa-refresh fa-fw"></i> Refresh
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <i class="fa fa-check-circle fa-fw"></i> Available
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <i class="fa fa-times fa-fw"></i> Busy
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <i class="fa fa-clock-o fa-fw"></i> Away
                                        </a>
                                    </li>
                                    <li class="divider"></li>
                                    <li>
                                        <a href="#">
                                            <i class="fa fa-sign-out fa-fw"></i> Sign Out
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <ul class="chat">
                                <li class="left clearfix">
                                    <span class="chat-img pull-left">
                                        <img class="img-circle" alt="User Avatar" src="http://placehold.it/50/55C1E7/fff">
                                    </span>
                                    <div class="chat-body clearfix">
                                        <div class="header">
                                            <strong class="primary-font">Jack Sparrow</strong> 
                                            <small class="pull-right text-muted">
                                                <i class="fa fa-clock-o fa-fw"></i> 12 mins ago
                                            </small>
                                        </div>
                                        <p>
                                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur bibendum ornare dolor, quis ullamcorper ligula sodales.
                                        </p>
                                    </div>
                                </li>
                                <li class="right clearfix">
                                    <span class="chat-img pull-right">
                                        <img class="img-circle" alt="User Avatar" src="http://placehold.it/50/FA6F57/fff">
                                    </span>
                                    <div class="chat-body clearfix">
                                        <div class="header">
                                            <small class=" text-muted">
                                                <i class="fa fa-clock-o fa-fw"></i> 13 mins ago</small>
                                            <strong class="pull-right primary-font">Bhaumik Patel</strong>
                                        </div>
                                        <p>
                                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur bibendum ornare dolor, quis ullamcorper ligula sodales.
                                        </p>
                                    </div>
                                </li>
                                <li class="left clearfix">
                                    <span class="chat-img pull-left">
                                        <img class="img-circle" alt="User Avatar" src="http://placehold.it/50/55C1E7/fff">
                                    </span>
                                    <div class="chat-body clearfix">
                                        <div class="header">
                                            <strong class="primary-font">Jack Sparrow</strong> 
                                            <small class="pull-right text-muted">
                                                <i class="fa fa-clock-o fa-fw"></i> 14 mins ago</small>
                                        </div>
                                        <p>
                                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur bibendum ornare dolor, quis ullamcorper ligula sodales.
                                        </p>
                                    </div>
                                </li>
                                <li class="right clearfix">
                                    <span class="chat-img pull-right">
                                        <img class="img-circle" alt="User Avatar" src="http://placehold.it/50/FA6F57/fff">
                                    </span>
                                    <div class="chat-body clearfix">
                                        <div class="header">
                                            <small class=" text-muted">
                                                <i class="fa fa-clock-o fa-fw"></i> 15 mins ago</small>
                                            <strong class="pull-right primary-font">Bhaumik Patel</strong>
                                        </div>
                                        <p>
                                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur bibendum ornare dolor, quis ullamcorper ligula sodales.
                                        </p>
                                    </div>
                                </li>
                            </ul>
                        </div>
                        <!-- /.panel-body -->
                        <div class="panel-footer">
                            <div class="input-group">
                                <input type="text" placeholder="Type your message here..." class="form-control input-sm" id="btn-input">
                                <span class="input-group-btn">
                                    <button id="btn-chat" class="btn btn-warning btn-sm">
                                        Send
                                    </button>
                                </span>
                            </div>
                        </div>
                        <!-- /.panel-footer -->
                    </div>
                    <!-- /.panel .chat-panel -->
                </div>
                <!-- /.col-lg-4 -->
            </div>
            <!-- /.row -->
        </div>

         <script type="text/jscript">
             function noBack() {
                 window.history.forward()
             }
             noBack();
             window.onload = noBack;
             window.onpageshow = function (evt) {
                 if (evt.persisted) noBack()
             }
             window.onunload = function () { void (0) }
</script>
</asp:Content>
