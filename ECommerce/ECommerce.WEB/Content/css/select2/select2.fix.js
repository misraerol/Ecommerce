var oldSelect2 = jQuery.fn.select2;
jQuery.fn.select2 = function () {
	//console.log(arguments);
	if (arguments.length === 1 && typeof arguments[0] === 'object') {
		var $element = jQuery(this); // tüm select2 elementleri üzerinde işlem yapılacak
		if (typeof arguments[0].dropdownParent !== 'defined') { // Dropdownparent tanımlamaası yapılmamış elemanlar için
			const modalParent = $element.parents('div.form-group').first(); // Elemana en yakın .form-group bulunur.
			if (modalParent.length > 0) {
				arguments[0].dropdownParent = modalParent; // Dropdownparent olarak bulunan .form-group atanır
			}
		}
		if (typeof arguments[0].ajaxUrl !== 'undefined') { // AjaxUrl'i tanımlaması yapılmış elemanlar için 
			arguments[0].ajax = {}; // Ajax isimli bir nesne oluşturulur
			arguments[0].ajax.processResults = function (response) { // processResults metodu düzenlenir.
				if (response.Status == 'Error') {
					Swal.fire({
						type: 'warning',
						title: 'Dikkat',
						html: response.Message,
						showConfirmButton: false,
						showCloseButton: true
					});
				}
				//console.log(response.Data.results);
				return {
					results: response.Data.results,
					pagination: response.Data.pagination
				};
			};
			arguments[0].ajax.type = $element.data('ajax-method') || 'GET';
			arguments[0].ajax.delay = 300; // Ajax delay 300 olarak ayarlanır.
			arguments[0].ajax.cache = false; // Ajax cache kapalı.
			arguments[0].ajax.data = function (params) { // Ajax parametre metodu düzenlenir.
				var query = {};
				query['term'] = params.term;
				query['page'] = params.page || 1;
				var ajaxParams = $element.data('ajax-data');
				if (ajaxParams) {
					var paramElements = $(ajaxParams);
					paramElements.each(function () {
						var paramElement = $(this);
						query[paramElement.attr('name')] = paramElement.val();
					});
				}
				return query;
			};
			arguments[0].templateResult = function formatState(data) {
				var row = '<span>';
				row += data.text;
				if (data.ext) {
					row += ' - ' + data.ext;
				}
				row += '</span>';
				var $row = $(row);
				return $row;
			};
			arguments[0].minimumInputLength = 2; // Aramaya başlamak için minimum karakter sayısı verilir.
			arguments[0].templateSelection = function (container) { // Listeye eklenen her eleman için update-data nesneleri yazılır.
				var json = container.data;
				//console.log(container);
				var jsonString = JSON.stringify(json);
				//console.log(jsonString);
				if (jsonString) {
					//$element.attr('data-update-data', jsonString);
					$(container.element).data('update-data', jsonString).attr('data-update-data', jsonString);
				}
				return container.text;
			};
		}
	}
	return oldSelect2.apply(this, arguments);
};
$('[data-plugin=select2][data-refresh][data-ajax-url]').on('select2:select', function (e) {
	$(this).attr('data-update-data', JSON.stringify(e.params.data.data));
});
$('[data-plugin=select2][data-refresh][data-ajax-url]').on('change.select2', function (e) {
	$(this).removeData('update-data').removeAttr('data-update-data');
	$(this).find('option:not(:empty):not(:selected)').detach();
});
$("select[data-plugin=select2][data-allow-insert]").on('select2:open', function () {
	var $element = $(this);
	var addButton = $('<div>').addClass('select2-results__insert text-right m-5').append($('<button>').attr('type', 'button').addClass('btn btn-xs btn-outline-info').append($('<i>').addClass('fal fa-plus mr-5')).append($element.data('insert-button') || 'Ekle'));
	//<div class="text-right m-5">
	//	<button href="#" class="btn btn-xs btn-outline-info"><i class="fal fa-plus"></i> Ekle</button>
	//</div>
	var results = $(".select2-results:not(:has(div))");
	results.append(addButton);
});
$(".form-group.form-material.floating").on('click', '.select2-container .select2-results button', function () {
	var $button = $(this);
	var $element = $button.closest('.form-group').find('select[data-plugin=select2]');
	var $form = $element.closest('form');
	var modal = $element.data('insert-modal');
	var $modal = $(modal);
	var valueField = $element.data('insert-value');
	var textField = $element.data('insert-text');
	var $dataFields = $($element.data('insert-data'));
	var hasError = false;
	$dataFields.each(function () {
		var $field = $(this);
		var isValid = $field.valid();
		var required = $field.data('insert-required')
		if (!hasError && isValid == 0) {
			scrollToError($field);
			hasError = true;
		}
		else if (required && !$field.val() && !hasError) {
			var validation = $field.closest('form').data('validation');
			var error = {};
			error[$field.attr('name')] = required;
			validation.showErrors(error);
			scrollToError($field);
			hasError = true;
		}
	});
	if (!hasError) {
		$dataFields.each(function () {
			var value = $(this).val();
			var fieldName = $(this).data('insert-name') || $(this).attr('name');
			$modal.find('[name=' + fieldName + ']').val(value).trigger('change');
			if ($(this).prop('tagName') == 'SELECT') {
				if (value) {
					var $option = $(this).find('option[value=' + value + ']');
					if ($option.length > 0) {
						$modal.find('[name=' + fieldName + 'Name]').val($option.text()).trigger('change');
					}
				}
			}
		});
		$modal.data('insert-value', valueField);
		$modal.data('insert-text', textField);
		$modal.data('insert-element', $element);
		$modal.modal('show');
	}
	else {
	}
});
var scrollToError = function ($field) {
	var $siteNav = $('.site-navbar');
	var $body = $('body');
	var $tabPane = $field.closest('.tab-pane');
	var $tabButton = $field.closest('.nav-tabs-horizontal').find('.nav-tabs li a[href*=' + $tabPane.attr('id') + ']');
	$tabButton.trigger('click');
	$([document.documentElement, document.body]).animate({
		scrollTop: $field.offset().top - ($body.height() / 2) + $siteNav.height()
	}, 500);
}
$("form select[data-plugin=select2]").on("select2:select", function (e) {
	$(this).valid(); // Select2 ile seçim yapıldığında validasyonu çalıştırır
});