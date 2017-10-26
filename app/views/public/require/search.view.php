<div class="row">
	<div class="col-lg-12 col-md-12 col-xs-12 col-sm-12">
		<div class="menu-vertical">
			<div class="box-title">Search</div>
			<div class="content-box">
				<form action="" method="get">
					<div class="cover-search">
						<label for="gender">Men or Women</label>
						<select class="select" name="gender" id="gender">
							<option 'selected="selected"' value="1">Men</option>
							<option value="0">Women</option>
						</select>
					</div>
					<div class="cover-search">
						<label for="style">Kinds</label>
						<select class="select" name="style" id="style">
							<?php
							if(isset($_POST['style']))
							{ 
								foreach($cats as $item){ ?>
								<option <?php if($item->id == $_POST['style']) echo 'selected="selected"';?> value= <?php echo $item->id?>><?php echo $item->name ?></option>
								<?php } 
							} else {
								foreach($cats as $item){ ?>
								<option <?php if($item->id == 1) echo 'selected="selected"';?> value= <?php echo $item->id?>><?php echo $item->name ?></option>
								<?php }} ?> 
			
						</select>
					</div>
					<div class="cover-search">
						<label>Price (VND): </label>
						<select class="select" name="price">
						<?php 
						$arr = array("Under 200.000", "From 200.000 to 500.000", "From 500.000 to 1.000.000",
						"Over 1.000.000");
						$arrlength = count($arr);
						for($i = 0; $i < $arrlength ; $i++) { ?> 
							<option <?php if($i == 1) echo 'selected="selected"';?>  
							value="<?=$i?>"><?=$arr[$i]?></option>
							<?php }?>
						</select>
					</div>
					<div class="cover-search">
						<button class="btn-search" type="button" name="search_public" id="search_public"
							onclick="search(1);">Search</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>