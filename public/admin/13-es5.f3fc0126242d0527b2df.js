function _defineProperties(e,t){for(var n=0;n<t.length;n++){var r=t[n];r.enumerable=r.enumerable||!1,r.configurable=!0,"value"in r&&(r.writable=!0),Object.defineProperty(e,r.key,r)}}function _createClass(e,t,n){return t&&_defineProperties(e.prototype,t),n&&_defineProperties(e,n),e}function _get(e,t,n){return(_get="undefined"!=typeof Reflect&&Reflect.get?Reflect.get:function(e,t,n){var r=_superPropBase(e,t);if(r){var i=Object.getOwnPropertyDescriptor(r,t);return i.get?i.get.call(n):i.value}})(e,t,n||e)}function _superPropBase(e,t){for(;!Object.prototype.hasOwnProperty.call(e,t)&&null!==(e=_getPrototypeOf(e)););return e}function _inherits(e,t){if("function"!=typeof t&&null!==t)throw new TypeError("Super expression must either be null or a function");e.prototype=Object.create(t&&t.prototype,{constructor:{value:e,writable:!0,configurable:!0}}),t&&_setPrototypeOf(e,t)}function _setPrototypeOf(e,t){return(_setPrototypeOf=Object.setPrototypeOf||function(e,t){return e.__proto__=t,e})(e,t)}function _createSuper(e){var t=_isNativeReflectConstruct();return function(){var n,r=_getPrototypeOf(e);if(t){var i=_getPrototypeOf(this).constructor;n=Reflect.construct(r,arguments,i)}else n=r.apply(this,arguments);return _possibleConstructorReturn(this,n)}}function _possibleConstructorReturn(e,t){return!t||"object"!=typeof t&&"function"!=typeof t?_assertThisInitialized(e):t}function _assertThisInitialized(e){if(void 0===e)throw new ReferenceError("this hasn't been initialised - super() hasn't been called");return e}function _isNativeReflectConstruct(){if("undefined"==typeof Reflect||!Reflect.construct)return!1;if(Reflect.construct.sham)return!1;if("function"==typeof Proxy)return!0;try{return Date.prototype.toString.call(Reflect.construct(Date,[],(function(){}))),!0}catch(e){return!1}}function _getPrototypeOf(e){return(_getPrototypeOf=Object.setPrototypeOf?Object.getPrototypeOf:function(e){return e.__proto__||Object.getPrototypeOf(e)})(e)}function _classCallCheck(e,t){if(!(e instanceof t))throw new TypeError("Cannot call a class as a function")}(window.webpackJsonp=window.webpackJsonp||[]).push([[13],{mxCH:function(e,t,n){"use strict";n.r(t);var r,i,l=n("vTDv"),a=n("tyNb"),o=n("fXoL"),d=((r=function e(){_classCallCheck(this,e)}).\u0275fac=function(e){return new(e||r)},r.\u0275cmp=o["\u0275\u0275defineComponent"]({type:r,selectors:[["deliveries"]],decls:1,vars:0,template:function(e,t){1&e&&o["\u0275\u0275element"](0,"router-outlet")},directives:[a.h],encapsulation:2}),r),s=n("YPVp"),c=n("CdOr"),u=n("VGB5"),p=n("aceb"),m=n("RS3s"),v=n("sYmb"),f=((i=function(e){_inherits(n,e);var t=_createSuper(n);function n(e,r,i){var l;return _classCallCheck(this,n),(l=t.call(this,r)).client=e,l.coreService=r,l.route=i,l.columns=[{key:"user",translation_key:"DELIVERY.FIELDS.USER.LABEL",column:{title:"",type:"string",valuePrepareFunction:function(e){var t;return null===(t=e)||void 0===t?void 0:t.mobile_number}}},{key:"is_online",translation_key:"DELIVERY.FIELDS.IS_ONLINE.LABEL",column:{title:"",type:"string",filter:!1}},{key:"assigned",translation_key:"DELIVERY.FIELDS.ASSIGNED.LABEL",column:{title:"",type:"string",filter:!1}}],l.editPageUrl="pages/deliveries/edit",l}return _createClass(n,[{key:"ngOnInit",value:function(){_get(_getPrototypeOf(n.prototype),"ngOnInit",this).call(this,this.client.getBaseEndpoint())}}]),n}(s.a)).\u0275fac=function(e){return new(e||i)(o["\u0275\u0275directiveInject"](u.a),o["\u0275\u0275directiveInject"](c.a),o["\u0275\u0275directiveInject"](a.a))},i.\u0275cmp=o["\u0275\u0275defineComponent"]({type:i,selectors:[["list"]],features:[o["\u0275\u0275InheritDefinitionFeature"]],decls:6,vars:6,consts:[["nbSpinnerStatus","danger",3,"nbSpinner"],[3,"settings","source","delete","edit"]],template:function(e,t){1&e&&(o["\u0275\u0275elementStart"](0,"nb-card"),o["\u0275\u0275elementStart"](1,"nb-card-header"),o["\u0275\u0275text"](2),o["\u0275\u0275pipe"](3,"translate"),o["\u0275\u0275elementEnd"](),o["\u0275\u0275elementStart"](4,"nb-card-body",0),o["\u0275\u0275elementStart"](5,"ng2-smart-table",1),o["\u0275\u0275listener"]("delete",(function(e){return t.onDeleteConfirm(e)}))("edit",(function(e){return t.edit(e)})),o["\u0275\u0275elementEnd"](),o["\u0275\u0275elementEnd"](),o["\u0275\u0275elementEnd"]()),2&e&&(o["\u0275\u0275advance"](2),o["\u0275\u0275textInterpolate1"](" ",o["\u0275\u0275pipeBind1"](3,4,"DELIVERY.LABELS.LIST")," "),o["\u0275\u0275advance"](2),o["\u0275\u0275property"]("nbSpinner",t.loading),o["\u0275\u0275advance"](1),o["\u0275\u0275property"]("settings",t.settings)("source",t.source))},directives:[p.o,p.q,p.n,p.bb,m.b],pipes:[v.c],styles:[".nb-theme-corporate   [_nghost-%COMP%]   nb-card[_ngcontent-%COMP%], .nb-theme-cosmic   [_nghost-%COMP%]   nb-card[_ngcontent-%COMP%], .nb-theme-dark   [_nghost-%COMP%]   nb-card[_ngcontent-%COMP%], .nb-theme-default   [_nghost-%COMP%]   nb-card[_ngcontent-%COMP%]{transform:translateZ(0)}"]}),i),y=n("lJxs");n("HxAg");var g=function e(){_classCallCheck(this,e)},h=function(e){_inherits(n,e);var t=_createSuper(n);function n(){var e;return _classCallCheck(this,n),(e=t.apply(this,arguments)).assigned=0,e.is_online=0,e.is_verified=0,e.meta={},e}return n}(n("uotl").a),E=function(e){_inherits(n,e);var t=_createSuper(n);function n(){return _classCallCheck(this,n),t.apply(this,arguments)}return n}(function(){return function e(){_classCallCheck(this,e)}}()),b=n("QNOW"),S=n("8C9V"),I=n("3Pt+"),_=n("ofXK");function R(e,t){if(1&e&&(o["\u0275\u0275elementStart"](0,"label",26),o["\u0275\u0275text"](1),o["\u0275\u0275elementEnd"]()),2&e){var n=t.$implicit;o["\u0275\u0275advance"](1),o["\u0275\u0275textInterpolate"](n)}}function x(e,t){if(1&e&&(o["\u0275\u0275elementStart"](0,"label",26),o["\u0275\u0275text"](1),o["\u0275\u0275elementEnd"]()),2&e){var n=t.$implicit;o["\u0275\u0275advance"](1),o["\u0275\u0275textInterpolate"](n)}}function C(e,t){if(1&e&&(o["\u0275\u0275elementStart"](0,"label",26),o["\u0275\u0275text"](1),o["\u0275\u0275elementEnd"]()),2&e){var n=t.$implicit;o["\u0275\u0275advance"](1),o["\u0275\u0275textInterpolate"](n)}}function O(e,t){if(1&e){var n=o["\u0275\u0275getCurrentView"]();o["\u0275\u0275elementStart"](0,"div",0),o["\u0275\u0275elementStart"](1,"div",1),o["\u0275\u0275elementStart"](2,"nb-card"),o["\u0275\u0275elementStart"](3,"nb-card-header"),o["\u0275\u0275text"](4),o["\u0275\u0275pipe"](5,"translate"),o["\u0275\u0275elementEnd"](),o["\u0275\u0275elementStart"](6,"nb-card-body"),o["\u0275\u0275elementStart"](7,"div",6),o["\u0275\u0275elementStart"](8,"label"),o["\u0275\u0275text"](9),o["\u0275\u0275pipe"](10,"translate"),o["\u0275\u0275elementEnd"](),o["\u0275\u0275elementStart"](11,"input",20,21),o["\u0275\u0275listener"]("ngModelChange",(function(e){return o["\u0275\u0275restoreView"](n),o["\u0275\u0275nextContext"]().deliveryRequest.email=e})),o["\u0275\u0275elementEnd"](),o["\u0275\u0275elementStart"](13,"label",14),o["\u0275\u0275text"](14),o["\u0275\u0275pipe"](15,"translate"),o["\u0275\u0275elementEnd"](),o["\u0275\u0275template"](16,R,2,1,"label",8),o["\u0275\u0275elementEnd"](),o["\u0275\u0275elementStart"](17,"div",6),o["\u0275\u0275elementStart"](18,"label"),o["\u0275\u0275text"](19),o["\u0275\u0275pipe"](20,"translate"),o["\u0275\u0275elementEnd"](),o["\u0275\u0275elementStart"](21,"input",22,23),o["\u0275\u0275listener"]("ngModelChange",(function(e){return o["\u0275\u0275restoreView"](n),o["\u0275\u0275nextContext"]().deliveryRequest.mobile_number=e})),o["\u0275\u0275elementEnd"](),o["\u0275\u0275elementStart"](23,"label",14),o["\u0275\u0275text"](24),o["\u0275\u0275pipe"](25,"translate"),o["\u0275\u0275elementEnd"](),o["\u0275\u0275template"](26,x,2,1,"label",8),o["\u0275\u0275elementEnd"](),o["\u0275\u0275elementStart"](27,"div",6),o["\u0275\u0275elementStart"](28,"label"),o["\u0275\u0275text"](29),o["\u0275\u0275pipe"](30,"translate"),o["\u0275\u0275elementEnd"](),o["\u0275\u0275elementStart"](31,"input",24,25),o["\u0275\u0275listener"]("ngModelChange",(function(e){return o["\u0275\u0275restoreView"](n),o["\u0275\u0275nextContext"]().deliveryRequest.password=e})),o["\u0275\u0275elementEnd"](),o["\u0275\u0275elementStart"](33,"label",14),o["\u0275\u0275text"](34),o["\u0275\u0275pipe"](35,"translate"),o["\u0275\u0275elementEnd"](),o["\u0275\u0275template"](36,C,2,1,"label",8),o["\u0275\u0275elementEnd"](),o["\u0275\u0275elementEnd"](),o["\u0275\u0275elementEnd"](),o["\u0275\u0275elementEnd"](),o["\u0275\u0275elementEnd"]()}if(2&e){var r=o["\u0275\u0275reference"](12),i=o["\u0275\u0275reference"](22),l=o["\u0275\u0275reference"](32),a=o["\u0275\u0275nextContext"]();o["\u0275\u0275advance"](4),o["\u0275\u0275textInterpolate"](o["\u0275\u0275pipeBind1"](5,17,"DELIVERY.FIELDS.USER.HEADER")),o["\u0275\u0275advance"](5),o["\u0275\u0275textInterpolate"](o["\u0275\u0275pipeBind1"](10,19,"USER.EMAIL.LABEL")),o["\u0275\u0275advance"](2),o["\u0275\u0275property"]("ngModel",a.deliveryRequest.email),o["\u0275\u0275advance"](2),o["\u0275\u0275property"]("hidden",r.valid||r.pristine),o["\u0275\u0275advance"](1),o["\u0275\u0275textInterpolate1"](" ",o["\u0275\u0275pipeBind1"](15,21,"USER.EMAIL.VALIDATION")," "),o["\u0275\u0275advance"](2),o["\u0275\u0275property"]("ngForOf",a.deliveryError.email),o["\u0275\u0275advance"](3),o["\u0275\u0275textInterpolate"](o["\u0275\u0275pipeBind1"](20,23,"USER.MOBILE_NUMBER.LABEL")),o["\u0275\u0275advance"](2),o["\u0275\u0275property"]("ngModel",a.deliveryRequest.mobile_number),o["\u0275\u0275advance"](2),o["\u0275\u0275property"]("hidden",i.valid||i.pristine),o["\u0275\u0275advance"](1),o["\u0275\u0275textInterpolate1"](" ",o["\u0275\u0275pipeBind1"](25,25,"USER.MOBILE_NUMBER.VALIDATION")," "),o["\u0275\u0275advance"](2),o["\u0275\u0275property"]("ngForOf",a.deliveryError.mobile_number),o["\u0275\u0275advance"](3),o["\u0275\u0275textInterpolate"](o["\u0275\u0275pipeBind1"](30,27,"USER.PASSWORD.LABEL")),o["\u0275\u0275advance"](2),o["\u0275\u0275property"]("ngModel",a.deliveryRequest.password)("required",!a.isEdit),o["\u0275\u0275advance"](2),o["\u0275\u0275property"]("hidden",l.valid||l.pristine),o["\u0275\u0275advance"](1),o["\u0275\u0275textInterpolate1"](" ",o["\u0275\u0275pipeBind1"](35,29,"USER.PASSWORD.VALIDATION")," "),o["\u0275\u0275advance"](2),o["\u0275\u0275property"]("ngForOf",a.deliveryError.password)}}function L(e,t){if(1&e&&(o["\u0275\u0275elementStart"](0,"label",26),o["\u0275\u0275text"](1),o["\u0275\u0275elementEnd"]()),2&e){var n=t.$implicit;o["\u0275\u0275advance"](1),o["\u0275\u0275textInterpolate"](n)}}function w(e,t){if(1&e&&(o["\u0275\u0275elementStart"](0,"label",26),o["\u0275\u0275text"](1),o["\u0275\u0275elementEnd"]()),2&e){var n=t.$implicit;o["\u0275\u0275advance"](1),o["\u0275\u0275textInterpolate"](n)}}function D(e,t){if(1&e&&(o["\u0275\u0275elementStart"](0,"div"),o["\u0275\u0275elementStart"](1,"a",27),o["\u0275\u0275text"](2),o["\u0275\u0275elementEnd"](),o["\u0275\u0275elementEnd"]()),2&e){var n=o["\u0275\u0275nextContext"]();o["\u0275\u0275advance"](1),o["\u0275\u0275property"]("href",null==n.deliveryRequest.meta?null:null==n.deliveryRequest.meta.documents?null:n.deliveryRequest.meta.documents.goverment_id,o["\u0275\u0275sanitizeUrl"]),o["\u0275\u0275advance"](1),o["\u0275\u0275textInterpolate"](null==n.deliveryRequest.meta?null:null==n.deliveryRequest.meta.documents?null:n.deliveryRequest.meta.documents.goverment_id)}}function q(e,t){if(1&e&&(o["\u0275\u0275elementStart"](0,"label",26),o["\u0275\u0275text"](1),o["\u0275\u0275elementEnd"]()),2&e){var n=t.$implicit;o["\u0275\u0275advance"](1),o["\u0275\u0275textInterpolate"](n)}}function B(e,t){if(1&e&&(o["\u0275\u0275elementStart"](0,"label",26),o["\u0275\u0275text"](1),o["\u0275\u0275elementEnd"]()),2&e){var n=t.$implicit;o["\u0275\u0275advance"](1),o["\u0275\u0275textInterpolate"](n)}}function M(e,t){if(1&e&&(o["\u0275\u0275elementStart"](0,"label",26),o["\u0275\u0275text"](1),o["\u0275\u0275elementEnd"]()),2&e){var n=t.$implicit;o["\u0275\u0275advance"](1),o["\u0275\u0275textInterpolate"](n)}}var P,k,A=((P=function(){function e(t,n,r){_classCallCheck(this,e),this.client=t,this.coreService=n,this.route=r,this.delivery=new g,this.deliveryRequest=new h,this.deliveryError=new E,this.showProgress=!1,this.showProgressButton=!1,this.categories=[],this.editId=null}return _createClass(e,[{key:"ngOnInit",value:function(){this.getEditData()}},{key:"getEditData",value:function(){var e=this.route.snapshot.paramMap.get("id");e&&(this.editId=e,this.getDataById(e).subscribe())}},{key:"getDataById",value:function(e){var t=this;return this.showProgress=!0,this.client.show(e).pipe(Object(y.a)((function(e){return t.showProgress=!1,t.delivery=e,t.deliveryRequest.assigned=t.delivery.assigned,t.deliveryRequest.is_online=t.delivery.is_online,t.deliveryRequest.is_verified=t.delivery.is_verified,t.deliveryRequest.latitude=t.delivery.latitude,t.deliveryRequest.longitude=t.delivery.longitude,t.deliveryRequest.meta=t.delivery.meta,e})))}},{key:"saveDelivery",value:function(){var e=this;this.metaeditorComponent.updatedMetaProperty(),this.showProgressButton=!0;var t=new FormData;t.append("assigned",String(this.deliveryRequest.assigned)),t.append("is_online",String(this.deliveryRequest.is_online)),t.append("is_verified",String(this.deliveryRequest.is_verified)),t.append("latitude",this.deliveryRequest.latitude),t.append("longitude",this.deliveryRequest.longitude),t.append("meta",JSON.stringify(this.deliveryRequest.meta)),this.editId||(t.append("email",this.deliveryRequest.email),t.append("mobile_number",this.deliveryRequest.mobile_number),t.append("password",this.deliveryRequest.password)),(this.editId?this.client.update(this.editId,t):this.client.store(t)).subscribe((function(t){e.showProgressButton=!1,e.coreService.toastService.showToast(b.b.SUCCESS,"Saved","Saved successfully!"),e.back()}),(function(t){var n,r,i,l,a,o,d,s;if(e.showProgressButton=!1,e.coreService.toastService.showToast(b.b.DANGER,"Failed",t.error.message),t.error.errors){var c=t.error.errors;e.deliveryError.longitude=null===(n=c)||void 0===n?void 0:n.longitude,e.deliveryError.latitude=null===(r=c)||void 0===r?void 0:r.latitude,e.deliveryError.assigned=null===(i=c)||void 0===i?void 0:i.assigned,e.deliveryError.is_online=null===(l=c)||void 0===l?void 0:l.is_online,e.deliveryError.is_verified=null===(a=c)||void 0===a?void 0:a.is_verified,e.deliveryError.email=null===(o=c)||void 0===o?void 0:o.email,e.deliveryError.mobile_number=null===(d=c)||void 0===d?void 0:d.mobile_number,e.deliveryError.password=null===(s=c)||void 0===s?void 0:s.password}}))}},{key:"back",value:function(){this.coreService.location.back()}},{key:"onIsOnlineChange",value:function(e){this.deliveryRequest.is_online=e?1:0}},{key:"onIsVerifiedChange",value:function(e){this.deliveryRequest.is_verified=e?1:0}}]),e}()).\u0275fac=function(e){return new(e||P)(o["\u0275\u0275directiveInject"](u.a),o["\u0275\u0275directiveInject"](c.a),o["\u0275\u0275directiveInject"](a.a))},P.\u0275cmp=o["\u0275\u0275defineComponent"]({type:P,selectors:[["save"]],viewQuery:function(e,t){var n;1&e&&o["\u0275\u0275viewQuery"](S.a,!0),2&e&&o["\u0275\u0275queryRefresh"](n=o["\u0275\u0275loadQuery"]())&&(t.metaeditorComponent=n.first)},decls:57,vars:45,consts:[[1,"row"],[1,"col-md-12"],["nbSpinnerStatus","danger",3,"nbSpinner"],[3,"ngSubmit"],["form","ngForm"],["class","row",4,"ngIf"],[1,"form-group"],["name","assigned","nbInput","","fullWidth","","disabled","",1,"form-control",3,"checked"],["class","error text-danger",4,"ngFor","ngForOf"],["name","is_online","nbInput","","fullWidth","",1,"form-control",3,"checked","change"],["name","is_verified","nbInput","","fullWidth","",1,"form-control",3,"checked","change"],[4,"ngIf"],["type","number","nbInput","","fullWidth","","placeholder","Latitude","name","latitude","required","",3,"ngModel","ngModelChange"],["latitude","ngModel"],[1,"error","text-danger",3,"hidden"],["type","number","nbInput","","fullWidth","","placeholder","Longitude","name","longitude","required","",3,"ngModel","ngModelChange"],["longitude","ngModel"],[3,"meta","metaChange"],["type","submit","nbButton","","status","success","size","medium","nbSpinnerStatus","success","nbSpinnerSize","small",3,"disabled","nbSpinner"],["type","button","nbButton","","status","danger","size","medium",3,"click"],["type","email","nbInput","","fullWidth","","placeholder","Email","name","email","required","",3,"ngModel","ngModelChange"],["email","ngModel"],["type","mobile_number","nbInput","","fullWidth","","placeholder","Mobile Number","name","mobile_number","required","",3,"ngModel","ngModelChange"],["mobile_number","ngModel"],["type","password","nbInput","","fullWidth","","id","password","placeholder","Password","name","password",3,"ngModel","required","ngModelChange"],["password","ngModel"],[1,"error","text-danger"],["target","_blank",3,"href"]],template:function(e,t){if(1&e&&(o["\u0275\u0275elementStart"](0,"div",0),o["\u0275\u0275elementStart"](1,"div",1),o["\u0275\u0275elementStart"](2,"nb-card"),o["\u0275\u0275elementStart"](3,"nb-card-body",2),o["\u0275\u0275elementStart"](4,"form",3,4),o["\u0275\u0275listener"]("ngSubmit",(function(){return t.saveDelivery()})),o["\u0275\u0275template"](6,O,37,31,"div",5),o["\u0275\u0275elementStart"](7,"div",6),o["\u0275\u0275elementStart"](8,"label"),o["\u0275\u0275text"](9),o["\u0275\u0275pipe"](10,"translate"),o["\u0275\u0275elementEnd"](),o["\u0275\u0275elementStart"](11,"nb-checkbox",7),o["\u0275\u0275text"](12," Assigned?"),o["\u0275\u0275elementEnd"](),o["\u0275\u0275template"](13,L,2,1,"label",8),o["\u0275\u0275elementEnd"](),o["\u0275\u0275elementStart"](14,"div",6),o["\u0275\u0275elementStart"](15,"label"),o["\u0275\u0275text"](16),o["\u0275\u0275pipe"](17,"translate"),o["\u0275\u0275elementEnd"](),o["\u0275\u0275elementStart"](18,"nb-checkbox",9),o["\u0275\u0275listener"]("change",(function(e){return t.onIsOnlineChange(e.target.checked)})),o["\u0275\u0275text"](19,"Is Online?"),o["\u0275\u0275elementEnd"](),o["\u0275\u0275template"](20,w,2,1,"label",8),o["\u0275\u0275elementEnd"](),o["\u0275\u0275elementStart"](21,"div",6),o["\u0275\u0275elementStart"](22,"label"),o["\u0275\u0275text"](23),o["\u0275\u0275pipe"](24,"translate"),o["\u0275\u0275elementEnd"](),o["\u0275\u0275elementStart"](25,"nb-checkbox",10),o["\u0275\u0275listener"]("change",(function(e){return t.onIsVerifiedChange(e.target.checked)})),o["\u0275\u0275text"](26,"Is Verified?"),o["\u0275\u0275elementEnd"](),o["\u0275\u0275template"](27,D,3,2,"div",11),o["\u0275\u0275template"](28,q,2,1,"label",8),o["\u0275\u0275elementEnd"](),o["\u0275\u0275elementStart"](29,"div",6),o["\u0275\u0275elementStart"](30,"label"),o["\u0275\u0275text"](31),o["\u0275\u0275pipe"](32,"translate"),o["\u0275\u0275elementEnd"](),o["\u0275\u0275elementStart"](33,"input",12,13),o["\u0275\u0275listener"]("ngModelChange",(function(e){return t.deliveryRequest.latitude=e})),o["\u0275\u0275elementEnd"](),o["\u0275\u0275elementStart"](35,"label",14),o["\u0275\u0275text"](36),o["\u0275\u0275pipe"](37,"translate"),o["\u0275\u0275elementEnd"](),o["\u0275\u0275template"](38,B,2,1,"label",8),o["\u0275\u0275elementEnd"](),o["\u0275\u0275elementStart"](39,"div",6),o["\u0275\u0275elementStart"](40,"label"),o["\u0275\u0275text"](41),o["\u0275\u0275pipe"](42,"translate"),o["\u0275\u0275elementEnd"](),o["\u0275\u0275elementStart"](43,"input",15,16),o["\u0275\u0275listener"]("ngModelChange",(function(e){return t.deliveryRequest.longitude=e})),o["\u0275\u0275elementEnd"](),o["\u0275\u0275elementStart"](45,"label",14),o["\u0275\u0275text"](46),o["\u0275\u0275pipe"](47,"translate"),o["\u0275\u0275elementEnd"](),o["\u0275\u0275template"](48,M,2,1,"label",8),o["\u0275\u0275elementEnd"](),o["\u0275\u0275elementStart"](49,"ngx-metaeditor",17),o["\u0275\u0275listener"]("metaChange",(function(e){return t.deliveryRequest.meta=e})),o["\u0275\u0275elementEnd"](),o["\u0275\u0275elementStart"](50,"button",18),o["\u0275\u0275text"](51),o["\u0275\u0275pipe"](52,"translate"),o["\u0275\u0275elementEnd"](),o["\u0275\u0275text"](53," \xa0 "),o["\u0275\u0275elementStart"](54,"button",19),o["\u0275\u0275listener"]("click",(function(){return t.back()})),o["\u0275\u0275text"](55),o["\u0275\u0275pipe"](56,"translate"),o["\u0275\u0275elementEnd"](),o["\u0275\u0275elementEnd"](),o["\u0275\u0275elementEnd"](),o["\u0275\u0275elementEnd"](),o["\u0275\u0275elementEnd"](),o["\u0275\u0275elementEnd"]()),2&e){var n=o["\u0275\u0275reference"](5),r=o["\u0275\u0275reference"](34),i=o["\u0275\u0275reference"](44);o["\u0275\u0275advance"](3),o["\u0275\u0275property"]("nbSpinner",t.showProgress),o["\u0275\u0275advance"](3),o["\u0275\u0275property"]("ngIf",!t.editId),o["\u0275\u0275advance"](3),o["\u0275\u0275textInterpolate"](o["\u0275\u0275pipeBind1"](10,27,"DELIVERY.FIELDS.ASSIGNED.LABEL")),o["\u0275\u0275advance"](2),o["\u0275\u0275property"]("checked",t.deliveryRequest.assigned),o["\u0275\u0275advance"](2),o["\u0275\u0275property"]("ngForOf",t.deliveryError.assigned),o["\u0275\u0275advance"](3),o["\u0275\u0275textInterpolate"](o["\u0275\u0275pipeBind1"](17,29,"DELIVERY.FIELDS.IS_ONLINE.LABEL")),o["\u0275\u0275advance"](2),o["\u0275\u0275property"]("checked",t.deliveryRequest.is_online),o["\u0275\u0275advance"](2),o["\u0275\u0275property"]("ngForOf",t.deliveryError.is_online),o["\u0275\u0275advance"](3),o["\u0275\u0275textInterpolate"](o["\u0275\u0275pipeBind1"](24,31,"DELIVERY.FIELDS.IS_VERIFIED.LABEL")),o["\u0275\u0275advance"](2),o["\u0275\u0275property"]("checked",t.deliveryRequest.is_verified),o["\u0275\u0275advance"](2),o["\u0275\u0275property"]("ngIf",null==t.deliveryRequest.meta?null:null==t.deliveryRequest.meta.documents?null:t.deliveryRequest.meta.documents.goverment_id),o["\u0275\u0275advance"](1),o["\u0275\u0275property"]("ngForOf",t.deliveryError.is_verified),o["\u0275\u0275advance"](3),o["\u0275\u0275textInterpolate"](o["\u0275\u0275pipeBind1"](32,33,"DELIVERY.FIELDS.LATITUDE.LABEL")),o["\u0275\u0275advance"](2),o["\u0275\u0275property"]("ngModel",t.deliveryRequest.latitude),o["\u0275\u0275advance"](2),o["\u0275\u0275property"]("hidden",r.valid||r.pristine),o["\u0275\u0275advance"](1),o["\u0275\u0275textInterpolate1"](" ",o["\u0275\u0275pipeBind1"](37,35,"DELIVERY.FIELDS.LATITUDE.VALIDATION")," "),o["\u0275\u0275advance"](2),o["\u0275\u0275property"]("ngForOf",t.deliveryError.latitude),o["\u0275\u0275advance"](3),o["\u0275\u0275textInterpolate"](o["\u0275\u0275pipeBind1"](42,37,"DELIVERY.FIELDS.LONGITUDE.LABEL")),o["\u0275\u0275advance"](2),o["\u0275\u0275property"]("ngModel",t.deliveryRequest.longitude),o["\u0275\u0275advance"](2),o["\u0275\u0275property"]("hidden",i.valid||i.pristine),o["\u0275\u0275advance"](1),o["\u0275\u0275textInterpolate1"](" ",o["\u0275\u0275pipeBind1"](47,39,"DELIVERY.FIELDS.LONGITUDE.VALIDATION")," "),o["\u0275\u0275advance"](2),o["\u0275\u0275property"]("ngForOf",t.deliveryError.longitude),o["\u0275\u0275advance"](1),o["\u0275\u0275property"]("meta",t.deliveryRequest.meta),o["\u0275\u0275advance"](1),o["\u0275\u0275property"]("disabled",!n.form.valid||t.showProgressButton)("nbSpinner",t.showProgressButton),o["\u0275\u0275advance"](1),o["\u0275\u0275textInterpolate1"](" ",o["\u0275\u0275pipeBind1"](52,41,"COMMON.SAVE")," "),o["\u0275\u0275advance"](4),o["\u0275\u0275textInterpolate1"](" ",o["\u0275\u0275pipeBind1"](56,43,"COMMON.BACK")," ")}},directives:[p.o,p.n,p.bb,I.B,I.q,I.r,_.m,p.t,_.l,I.u,p.D,I.b,I.x,I.p,I.s,S.a,p.l,p.q],pipes:[v.c],encapsulation:2}),P),V=[{path:"",component:d,children:[{path:"add",component:A},{path:"list",component:f},{path:"edit/:id",component:A}]}],F=((k=function e(){_classCallCheck(this,e)}).\u0275mod=o["\u0275\u0275defineNgModule"]({type:k}),k.\u0275inj=o["\u0275\u0275defineInjector"]({factory:function(e){return new(e||k)},imports:[[a.g.forChild(V)],a.g]}),k);n.d(t,"DeliveriesModule",(function(){return j}));var N,j=((N=function e(){_classCallCheck(this,e)}).\u0275mod=o["\u0275\u0275defineNgModule"]({type:N}),N.\u0275inj=o["\u0275\u0275defineInjector"]({factory:function(e){return new(e||N)},imports:[[l.a,F]]}),N)}}]);