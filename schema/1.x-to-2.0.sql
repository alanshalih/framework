/** Upgrade 1.x to 2.0 **/

RENAME TABLE `bot_answers` TO `bot_nodes`;
ALTER TABLE `bot_nodes` ADD `wait` VARCHAR(99) NULL AFTER `answers`;
ALTER TABLE `bot_nodes` ADD `instance_id` INT UNSIGNED NULL AFTER `id`;
ALTER TABLE `bot_nodes` ADD `tags` VARCHAR(255) NULL AFTER `status`;


ALTER TABLE `bot_leads` ADD `instance_id` INT UNSIGNED NULL AFTER `id`;
ALTER TABLE `bot_leads` ADD `is_payment_enabled` VARCHAR(30) NULL AFTER `subscribe`;
--
-- Table structure for table `bot_instances`
--

CREATE TABLE `bot_instances` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `meta` text,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bot_instances`
--
ALTER TABLE `bot_instances`
  ADD UNIQUE KEY `ix_instance_id` (`id`);



--
-- Table structure for table `bot_messages`
--

CREATE TABLE `bot_messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `instance_id` int(10) UNSIGNED DEFAULT NULL,
  `to_lead` text,
  `to_channel` text,
  `content` text NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `multiple` varchar(10) DEFAULT NULL,
  `routines` varchar(255) DEFAULT NULL,
  `unique_id` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `start_at` timestamp NULL DEFAULT NULL,
  `end_at` timestamp NULL DEFAULT NULL,
  `sent_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bot_messages`
--
ALTER TABLE `bot_messages`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bot_messages`
--
ALTER TABLE `bot_messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;