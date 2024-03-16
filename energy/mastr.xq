declare namespace mastrcommon="https://www.marktstammdatenregister.de/Services/Public/1_2/Modelle/Common";

http:send-request(
  <http:request method='POST'>
    <http:body media-type='application/soap+xml'/>
  </http:request>,
  'https://www.marktstammdatenregister.de/MaStRApi/Api.svc/Soap12/Common',

<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:com="https://www.marktstammdatenregister.de/Services/Public/1_2/Modelle/Common">
   <soapenv:Header/>
   <soapenv:Body>
      <com:GetLokaleUhrzeitRequest/>
   </soapenv:Body>
</soapenv:Envelope>
)

