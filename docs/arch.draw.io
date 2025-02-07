<mxfile host="app.diagrams.net" agent="Mozilla/5.0 (X11; Linux x86_64; rv:134.0) Gecko/20100101 Firefox/134.0" version="26.0.11">
  <diagram name="Page-1" id="QXAsngkIbwqI6tipVcXD">
    <mxGraphModel dx="1728" dy="933" grid="0" gridSize="10" guides="1" tooltips="1" connect="1" arrows="1" fold="1" page="1" pageScale="0.7" pageWidth="1400" pageHeight="850" math="0" shadow="0">
      <root>
        <mxCell id="0" />
        <mxCell id="1" parent="0" />
        <mxCell id="WihsZJQJzk5ifC5aRk6o-6" value="AWS Cloud" style="points=[[0,0],[0.25,0],[0.5,0],[0.75,0],[1,0],[1,0.25],[1,0.5],[1,0.75],[1,1],[0.75,1],[0.5,1],[0.25,1],[0,1],[0,0.75],[0,0.5],[0,0.25]];outlineConnect=0;gradientColor=none;html=1;whiteSpace=wrap;fontSize=12;fontStyle=0;container=1;pointerEvents=0;collapsible=0;recursiveResize=0;shape=mxgraph.aws4.group;grIcon=mxgraph.aws4.group_aws_cloud_alt;strokeColor=#232F3E;fillColor=none;verticalAlign=top;align=left;spacingLeft=30;fontColor=#232F3E;dashed=0;" vertex="1" parent="1">
          <mxGeometry x="208" y="43" width="720" height="400" as="geometry" />
        </mxCell>
        <mxCell id="WihsZJQJzk5ifC5aRk6o-10" value="&lt;div&gt;/notifications&lt;/div&gt;" style="sketch=0;points=[[0,0,0],[0.25,0,0],[0.5,0,0],[0.75,0,0],[1,0,0],[0,1,0],[0.25,1,0],[0.5,1,0],[0.75,1,0],[1,1,0],[0,0.25,0],[0,0.5,0],[0,0.75,0],[1,0.25,0],[1,0.5,0],[1,0.75,0]];outlineConnect=0;fontColor=#232F3E;fillColor=#8C4FFF;strokeColor=#ffffff;dashed=0;verticalLabelPosition=bottom;verticalAlign=top;align=center;html=1;fontSize=12;fontStyle=0;aspect=fixed;shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.api_gateway;" vertex="1" parent="WihsZJQJzk5ifC5aRk6o-6">
          <mxGeometry x="80" y="80" width="80" height="80" as="geometry" />
        </mxCell>
        <mxCell id="WihsZJQJzk5ifC5aRk6o-11" value="AWS SQS" style="sketch=0;points=[[0,0,0],[0.25,0,0],[0.5,0,0],[0.75,0,0],[1,0,0],[0,1,0],[0.25,1,0],[0.5,1,0],[0.75,1,0],[1,1,0],[0,0.25,0],[0,0.5,0],[0,0.75,0],[1,0.25,0],[1,0.5,0],[1,0.75,0]];outlineConnect=0;fontColor=#232F3E;fillColor=#E7157B;strokeColor=#ffffff;dashed=0;verticalLabelPosition=bottom;verticalAlign=top;align=center;html=1;fontSize=12;fontStyle=0;aspect=fixed;shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.sqs;" vertex="1" parent="WihsZJQJzk5ifC5aRk6o-6">
          <mxGeometry x="240" y="80" width="80" height="80" as="geometry" />
        </mxCell>
        <mxCell id="WihsZJQJzk5ifC5aRk6o-14" value="&lt;div&gt;NotifcationsTable&lt;/div&gt;" style="sketch=0;points=[[0,0,0],[0.25,0,0],[0.5,0,0],[0.75,0,0],[1,0,0],[0,1,0],[0.25,1,0],[0.5,1,0],[0.75,1,0],[1,1,0],[0,0.25,0],[0,0.5,0],[0,0.75,0],[1,0.25,0],[1,0.5,0],[1,0.75,0]];outlineConnect=0;fontColor=#232F3E;fillColor=#C925D1;strokeColor=#ffffff;dashed=0;verticalLabelPosition=bottom;verticalAlign=top;align=center;html=1;fontSize=12;fontStyle=0;aspect=fixed;shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.dynamodb;" vertex="1" parent="WihsZJQJzk5ifC5aRk6o-6">
          <mxGeometry x="560" y="80" width="80" height="80" as="geometry" />
        </mxCell>
        <mxCell id="WihsZJQJzk5ifC5aRk6o-27" value="AWS Lambda&lt;br&gt;(Authorizer)" style="sketch=0;points=[[0,0,0],[0.25,0,0],[0.5,0,0],[0.75,0,0],[1,0,0],[0,1,0],[0.25,1,0],[0.5,1,0],[0.75,1,0],[1,1,0],[0,0.25,0],[0,0.5,0],[0,0.75,0],[1,0.25,0],[1,0.5,0],[1,0.75,0]];outlineConnect=0;fontColor=#232F3E;fillColor=#ED7100;strokeColor=#ffffff;dashed=0;verticalLabelPosition=bottom;verticalAlign=top;align=center;html=1;fontSize=12;fontStyle=0;aspect=fixed;shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.lambda;" vertex="1" parent="WihsZJQJzk5ifC5aRk6o-6">
          <mxGeometry x="240" y="240" width="80" height="80" as="geometry" />
        </mxCell>
        <mxCell id="WihsZJQJzk5ifC5aRk6o-45" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;entryX=0;entryY=0.25;entryDx=0;entryDy=0;entryPerimeter=0;" edge="1" parent="WihsZJQJzk5ifC5aRk6o-6" target="WihsZJQJzk5ifC5aRk6o-27">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="140" y="190" as="sourcePoint" />
            <Array as="points">
              <mxPoint x="140" y="260" />
            </Array>
          </mxGeometry>
        </mxCell>
        <mxCell id="WihsZJQJzk5ifC5aRk6o-46" value="2a. Token" style="edgeLabel;html=1;align=center;verticalAlign=middle;resizable=0;points=[];" vertex="1" connectable="0" parent="WihsZJQJzk5ifC5aRk6o-45">
          <mxGeometry x="-0.1883" y="1" relative="1" as="geometry">
            <mxPoint x="35" as="offset" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WihsZJQJzk5ifC5aRk6o-48" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;exitX=0;exitY=0.75;exitDx=0;exitDy=0;exitPerimeter=0;" edge="1" parent="WihsZJQJzk5ifC5aRk6o-6" source="WihsZJQJzk5ifC5aRk6o-27">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="100" y="190" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WihsZJQJzk5ifC5aRk6o-49" value="2b. Policy" style="edgeLabel;html=1;align=center;verticalAlign=middle;resizable=0;points=[];" vertex="1" connectable="0" parent="WihsZJQJzk5ifC5aRk6o-48">
          <mxGeometry x="-0.0976" y="-1" relative="1" as="geometry">
            <mxPoint x="48" y="1" as="offset" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WihsZJQJzk5ifC5aRk6o-50" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;exitX=1;exitY=0.25;exitDx=0;exitDy=0;exitPerimeter=0;entryX=0;entryY=0.25;entryDx=0;entryDy=0;entryPerimeter=0;" edge="1" parent="WihsZJQJzk5ifC5aRk6o-6">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="160" y="119.58" as="sourcePoint" />
            <mxPoint x="240" y="119.58" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WihsZJQJzk5ifC5aRk6o-52" value="AWS Lambda&lt;br&gt;(Notification)" style="sketch=0;points=[[0,0,0],[0.25,0,0],[0.5,0,0],[0.75,0,0],[1,0,0],[0,1,0],[0.25,1,0],[0.5,1,0],[0.75,1,0],[1,1,0],[0,0.25,0],[0,0.5,0],[0,0.75,0],[1,0.25,0],[1,0.5,0],[1,0.75,0]];outlineConnect=0;fontColor=#232F3E;fillColor=#ED7100;strokeColor=#ffffff;dashed=0;verticalLabelPosition=bottom;verticalAlign=top;align=center;html=1;fontSize=12;fontStyle=0;aspect=fixed;shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.lambda;" vertex="1" parent="WihsZJQJzk5ifC5aRk6o-6">
          <mxGeometry x="400" y="80" width="80" height="80" as="geometry" />
        </mxCell>
        <mxCell id="WihsZJQJzk5ifC5aRk6o-54" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;exitX=1;exitY=0.25;exitDx=0;exitDy=0;exitPerimeter=0;entryX=0;entryY=0.25;entryDx=0;entryDy=0;entryPerimeter=0;" edge="1" parent="WihsZJQJzk5ifC5aRk6o-6">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="320" y="119.58" as="sourcePoint" />
            <mxPoint x="400" y="119.58" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WihsZJQJzk5ifC5aRk6o-55" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;exitX=1;exitY=0.25;exitDx=0;exitDy=0;exitPerimeter=0;entryX=0;entryY=0.25;entryDx=0;entryDy=0;entryPerimeter=0;" edge="1" parent="WihsZJQJzk5ifC5aRk6o-6">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="480" y="119.58" as="sourcePoint" />
            <mxPoint x="560" y="119.58" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WihsZJQJzk5ifC5aRk6o-57" value="&lt;div&gt;write&lt;/div&gt;&lt;div&gt;notification&lt;/div&gt;" style="edgeLabel;html=1;align=center;verticalAlign=middle;resizable=0;points=[];" vertex="1" connectable="0" parent="WihsZJQJzk5ifC5aRk6o-55">
          <mxGeometry x="-0.2208" y="1" relative="1" as="geometry">
            <mxPoint x="9" as="offset" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WihsZJQJzk5ifC5aRk6o-33" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;" edge="1" parent="1">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="128" y="173" as="sourcePoint" />
            <mxPoint x="288" y="173" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WihsZJQJzk5ifC5aRk6o-34" value="1a. POST new" style="edgeLabel;html=1;align=center;verticalAlign=middle;resizable=0;points=[];" vertex="1" connectable="0" parent="WihsZJQJzk5ifC5aRk6o-33">
          <mxGeometry x="-0.7875" relative="1" as="geometry">
            <mxPoint x="62" as="offset" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WihsZJQJzk5ifC5aRk6o-32" value="Client" style="sketch=0;outlineConnect=0;fontColor=#232F3E;gradientColor=none;strokeColor=#232F3E;fillColor=#ffffff;dashed=0;verticalLabelPosition=bottom;verticalAlign=top;align=center;html=1;fontSize=12;fontStyle=0;aspect=fixed;shape=mxgraph.aws4.resourceIcon;resIcon=mxgraph.aws4.client;" vertex="1" parent="1">
          <mxGeometry x="48" y="123" width="80" height="80" as="geometry" />
        </mxCell>
        <mxCell id="WihsZJQJzk5ifC5aRk6o-43" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;exitX=0;exitY=0.25;exitDx=0;exitDy=0;exitPerimeter=0;" edge="1" parent="1" source="WihsZJQJzk5ifC5aRk6o-10" target="WihsZJQJzk5ifC5aRk6o-32">
          <mxGeometry relative="1" as="geometry">
            <Array as="points">
              <mxPoint x="178" y="143" />
              <mxPoint x="178" y="143" />
            </Array>
          </mxGeometry>
        </mxCell>
        <mxCell id="WihsZJQJzk5ifC5aRk6o-44" value="1b. Response" style="edgeLabel;html=1;align=center;verticalAlign=middle;resizable=0;points=[];" vertex="1" connectable="0" parent="WihsZJQJzk5ifC5aRk6o-43">
          <mxGeometry x="0.2875" y="-2" relative="1" as="geometry">
            <mxPoint x="23" as="offset" />
          </mxGeometry>
        </mxCell>
        <mxCell id="WihsZJQJzk5ifC5aRk6o-58" value="&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;JWKS URI&lt;br&gt;&lt;/div&gt;" style="shape=mxgraph.mockup.containers.marginRect;rectMarginTop=10;strokeColor=#666666;strokeWidth=1;dashed=0;rounded=1;arcSize=5;recursiveResize=0;html=1;whiteSpace=wrap;" vertex="1" parent="1">
          <mxGeometry x="428" y="483" width="140" height="80" as="geometry" />
        </mxCell>
        <mxCell id="WihsZJQJzk5ifC5aRk6o-59" value="Auth0 IdP" style="shape=rect;strokeColor=none;fillColor=#008cff;strokeWidth=1;dashed=0;rounded=1;arcSize=20;fontColor=#ffffff;fontSize=17;spacing=2;spacingTop=-2;align=left;autosize=1;spacingLeft=4;resizeWidth=0;resizeHeight=0;perimeter=none;html=1;whiteSpace=wrap;" vertex="1" parent="WihsZJQJzk5ifC5aRk6o-58">
          <mxGeometry x="5" width="100" height="30" as="geometry" />
        </mxCell>
        <mxCell id="WihsZJQJzk5ifC5aRk6o-60" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;" edge="1" parent="1" target="WihsZJQJzk5ifC5aRk6o-58">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="468" y="403" as="sourcePoint" />
            <Array as="points">
              <mxPoint x="468" y="443" />
              <mxPoint x="468" y="443" />
            </Array>
          </mxGeometry>
        </mxCell>
        <mxCell id="WihsZJQJzk5ifC5aRk6o-61" value="verify" style="edgeLabel;html=1;align=center;verticalAlign=middle;resizable=0;points=[];" vertex="1" connectable="0" parent="WihsZJQJzk5ifC5aRk6o-60">
          <mxGeometry x="-0.1889" y="2" relative="1" as="geometry">
            <mxPoint y="8" as="offset" />
          </mxGeometry>
        </mxCell>
      </root>
    </mxGraphModel>
  </diagram>
</mxfile>
